attrs :: (attrs: ..Attribute) -> []Attribute {
	return attrs;
}

is :: (a: string, v: string = "") -> Attribute {
	return .{a, v};
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

#scope_file
global_heading := 1;
