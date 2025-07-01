make :: (sb: *String_Builder, html: HTML) {
	print(sb, "<!doctype html>\n");
	print(sb, "<html lang=\"%\">\n", html.lang);
	defer print(sb, "</html>\n");

	nesting += 1;
	defer nesting -=1;
	make(sb, html.head);
	make(sb, html.body);
}

tag :: (sb: *String_Builder, name: string, global_attrs: []Attribute, more_attributes: ..Attribute, is_void := false) {
	print(sb, "<%", name);
	make(sb, global_attrs);
	make(sb, more_attributes);
	if is_void print(sb, "/>");
	else print(sb, ">");
}

nest :: (sb: *String_Builder) {
	for 0..nesting-1
		print(sb, "\t");
}

make :: (sb: *String_Builder, attribute: Attribute) {
	print(sb, "%", attribute.attribute);
	if attribute.value.count print(sb, "=\"%\"", attribute.value);
}

make :: (sb: *String_Builder, attributes: []Attribute) {
	if attributes.count print(sb, " ");
	for attributes {
		make(sb, it);
		if it_index != attributes.count-1 print(sb, " ");
	}
}

make :: (sb: *String_Builder, head: Head) {
	nest(sb);
	print(sb, "<head>\n");

	nesting += 1;
	for head.metadata {
		if it.style {
			nest(sb);
			print(sb, "<style>%</style>\n", it.style);
		} else if it.link.href {
			nest(sb);
			l := it.link;
			tag(sb, "link", l.global_attributes, .{"rel", l.rel}, .{"href", l.href}, is_void = true);
			print(sb, "\n");
		} else if it.meta {
			nest(sb);
			tag(sb, "meta", it.meta, is_void = true);
			print(sb, "\n");
		}
	}
	nest(sb);
	print(sb, "<title>%</title>\n", head.title);
	nesting -= 1;

	nest(sb);
	print(sb, "</head>\n");
}

make :: (sb: *String_Builder, body: Body) {
	nest(sb);
	tag(sb, "body", body.global_attributes);
	print(sb, "\n");
	defer {
		nest(sb);
		print(sb, "</body>\n");
	}

	nesting += 1;
	defer nesting -=1;

	make(sb, body.content);
}

make :: (sb: *String_Builder, flow: []Flow) {
	for flow {
		nest(sb);
		make(sb, it);
	}
}

make :: (sb: *String_Builder, flow: Flow) {
	make(sb, flow.only_flow);
	//make(sb, flow.interactive);
	make(sb, flow.phrasing);
	//make(sb, flow.sectioning);
	make(sb, flow.heading);
}

make :: (sb: *String_Builder, only_flow: Only_Flow) {
	if only_flow.fcontent
		print(sb, "%", only_flow.fcontent);
	else if only_flow.p.content
		make(sb, only_flow.p);
}

make :: (sb: *String_Builder, heading: Heading) {
	if heading.h.content {
		tag(sb, tprint("h%", heading.h.level), heading.h.global_attributes);
		nesting += 1;
		make(sb, heading.h.content);
		nesting -= 1;
		print(sb, "</h%>\n", heading.h.level);
	} else if heading.hgroup.h.content { 
		tag(sb, "hgroup", heading.hgroup.global_attributes);
		print(sb, "\n");
		nesting += 1;
		nest(sb);
		make(sb, Heading.{h = heading.hgroup.h});
		for heading.hgroup.sub {
			nest(sb);
			make(sb, it);
		}
		nesting -= 1;
		nest(sb);
		print(sb, "</hroup>\n");
	}
}

make :: (sb: *String_Builder, p: P) {
	tag(sb, "p", p.global_attributes);
	nesting += 1;
	make(sb, p.content);
	nesting -= 1;
	print(sb, "</p>\n");
}

make :: (sb: *String_Builder, phrasing: []Phrasing) {
	for phrasing {
		//nest(sb);
		make(sb, it);
	}
}

make :: (sb: *String_Builder, phrasing: Phrasing) {
	make(sb, phrasing.only_phrasing);
	//make(sb, phrasing.embedded);
	make(sb, phrasing.phrasing_interactive);
	//make(sb, phrasing.metadata_phrasing);
}

make :: (sb: *String_Builder, only_phrasing: Only_Phrasing) {
	attr: []Attribute;
	etag: string;
	content: []Phrasing;

	if only_phrasing.pcontent {
		print(sb, "%", only_phrasing.pcontent);
		return;
	} else if only_phrasing.b.content {
		attr = only_phrasing.b.global_attributes;
		etag = "b";
		content = only_phrasing.b.content;
	} else if only_phrasing.code.content {
		attr = only_phrasing.code.global_attributes;
		etag = "code";
		content = only_phrasing.code.content;
	} else if only_phrasing.em.content {
		attr = only_phrasing.em.global_attributes;
		etag = "em";
		content = only_phrasing.em.content;
	} else {
		for 1..only_phrasing.br.count {
			print(sb, "<br/>\n");
			nest(sb);
		}
		return;
	}

	if etag {
		tag(sb, etag, attr);
		make(sb, content);
		print(sb, "</%>", etag);
	}
}

make :: (sb: *String_Builder, phrasing_interactive: Phrasing_Interactive) {
	if phrasing_interactive.a.content {
		a := phrasing_interactive.a;
		if a.target {
			tag(sb, "a", a.global_attributes, .{"target", a.target}, .{"href", a.href});
		} else {
			tag(sb, "a", a.global_attributes, .{"href", a.href});
		}
		make(sb, a.content);
		print(sb,  "</a>");
	}
}

#import "Basic";

#scope_file
nesting := 0;
