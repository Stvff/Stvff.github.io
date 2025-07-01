attrs :: (attrs: ..Attribute) -> []Attribute {
	return attrs;
}

is :: (a: string, v: string = "") -> Attribute {
	return .{a, v};
}

a :: (href: string, c: ..Phrasing, target := "", attr: []Attribute = .[]) -> Phrasing {
	return .{ a = .{
		global_attributes = attr,
		href = href,
		target = target,
		content = c
	} };
}

br :: (count := 1) -> Phrasing {
	return .{ br = .{count} };
}

s :: (text: string) -> Phrasing {
	return .{
		pcontent = text
	};
}

p :: (c: ..Phrasing, attr: []Attribute = .[]) -> Flow {
	return .{ p = .{
		global_attributes = attr,
		content = c,
	} };
}

next_h :: (c: ..Phrasing, attr: []Attribute = .[]) -> Flow {
	return .{ h = .{
		global_attributes = attr,
		level = global_heading,
		content = c,
	} };
}

nest_h :: (c: ..Phrasing, attr: []Attribute = .[]) -> Flow {
	global_heading += 1;
	return .{ h = .{
		global_attributes = attr,
		level = global_heading,
		content = c,
	} };
}

level_h :: (level: int, c: ..Phrasing, attr: []Attribute = .[]) -> Flow {
	global_heading = level;
	return .{ h = .{
		global_attributes = attr,
		level = global_heading,
		content = c,
	} };
}

hgroup :: (header: H, subtitle: ..P, attr: []Attribute = .[], subtitle_before := false) -> Flow {
	return .{ hgroup = .{
			global_attributes = attr,
			sub_before = subtitle_before,
			h = header,
			sub = subtitle,
	} };
}

#scope_file
global_heading := 1;
