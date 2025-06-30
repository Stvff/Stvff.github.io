/* these are all unions (here as structs for several different reasons) */

Other :: struct {
	using only_other: Only_Other;
	using other_metadata: Other_Metadata;
}

Only_Other :: struct {
	body: Body;
	head: Head;
	caption: Caption;
	figcaption: Figcaption;
	summary: Summary;
	source: Source;
	colgroup: Colgroup;
	col: Col;
	thead: Thead;
	tbody: Tbody;
	tr: Tr;
	th: Th;
	td: Td;
	tfoot: Tfoot;
}

Flow :: struct {
	using only_flow: Only_Flow;
	using interactive: Flow_Interactive;
	using phrasing: Phrasing;
	using sectioning: Sectioning;
	using heading: Heading;
}

Only_Flow :: struct {
	fcontent: string;

	blockquote: Blockquote;
	div: Div;
	figure: Figure;
	footer: Footer;
	header: Header;
	main: Main;
	ol: Ol;
	p: P;
	table: Table;
	ul: Ul;
}

Phrasing :: struct {
	using only_phrasing: Only_Phrasing;
	using embedded: Embedded;
	using phrasing_interactive: Phrasing_Interactive;
	using metadata_phrasing: Metadata_Phrasing;
}

Only_Phrasing :: struct {
	pcontent: string;

	br: Br;
	b: B;
	code: Codeb;
	em: Em;
}

Embedded :: struct {
	using phrasing_embedded: Phrasing_Embedded;
	using embedded_interactive: Embedded_Interactive;
}

Phrasing_Embedded :: struct {
	picture: Picture;
}

Interactive :: struct {
	using flow_interactive: Flow_Interactive;
	using phrasing_interactive: Phrasing_Interactive;
	using embedded_interactive: Embedded_Interactive;
}

Flow_Interactive :: struct {
	details: Details;
}

Phrasing_Interactive :: struct {
	a: A;
	button: Button;
}

Embedded_Interactive :: struct {
	img: Img;
}

Metadata :: struct {
	using other_metadata: Other_Metadata;
	using metadata_phrasing: Metadata_Phrasing;
}

Other_Metadata :: struct {
	style: Style;
}

Metadata_Phrasing :: struct {
	link: Link;
	meta: Meta;
}

Sectioning :: struct {
	aside: Aside;
	nav: Nav;
	section: Section;
}

Heading :: struct {
	h: H;
	hgroup: Hgroup;
}
