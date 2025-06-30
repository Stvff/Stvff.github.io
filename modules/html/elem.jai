HTML :: struct {
	lang: string;
	head: Head;
	body: Body;
}

/********** a **********/
A :: struct {
	global_attributes : []Attribute;
	target: string;
	href: string;
	content: []A_Content;
}
A_Content :: struct {
	using flow: Flow;
	using other: Other;
}

Aside :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

/********** b **********/
B :: struct {
	global_attributes : []Attribute;
	content: []Phrasing;
}

Base :: struct {
	global_attributes : []Attribute;
	target: string;
	href: string;
}

Blockquote :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

Body :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

Br :: struct { count: int = 1; }

Button :: struct {
	global_attributes : []Attribute;
	content: []Button_Content;
}
Button_Content :: struct {
	using only_phrasing: Only_Phrasing;
	using phrasing_embedded: Phrasing_Embedded;
	using metadata_phrasing: Metadata_Phrasing;
}

/********** c **********/
Caption :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

Codeb :: struct {
	global_attributes : []Attribute;
	content: []Phrasing;
}

Col :: struct {
	global_attributes : []Attribute;
	span: string;
}

Colgroup :: struct {
	global_attributes : []Attribute;
	cols: []Col;
}

/********** d **********/
Details :: struct {
	global_attributes : []Attribute;
	name: string;
	open: bool;
	summary: Summary;
	content: []Flow;
}

Div :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

/********** e **********/
Em :: struct {
	global_attributes : []Attribute;
	content: []Phrasing;
}

/********** f **********/
Figcaption :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

Figure :: struct {
	global_attributes : []Attribute;
	caption_before := false;
	figcaption: Figcaption;
	content: []Flow;
}

Footer :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

/********** h **********/
H :: struct {
	global_attributes : []Attribute;
	level: int;
	content: []Phrasing;
}

Head :: struct {
	metadata: []Metadata;
	base: Base;
	title: Title;
}

Header :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

Hgroup :: struct {
	global_attributes : []Attribute;
	sub_before := false;
	h: H;
	sub: []P;
}

/********** i **********/
Img :: struct {
	global_attributes : []Attribute;
	src: string;
	alt: string;
}

/********** k **********/

/********** l **********/
Li :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

Link :: struct {
	global_attributes : []Attribute;
	rel: string;
	href: string;
}

/********** m **********/
Main :: struct {
	global_attributes: []Attribute;
	content: []Flow;
}

Meta :: []Attribute;

/********** n **********/
Nav :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

/********** o **********/
Ol :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

/********** p **********/
P :: struct {
	global_attributes : []Attribute;
	content: []Phrasing;
}

Picture :: struct {
	global_attributes : []Attribute;
	sources: []Source;
	img: Img;
}

/********** q **********/
/********** r **********/
/********** s **********/
Section :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

Source :: struct {
	global_attributes : []Attribute;
	src: string;
	type: string;
	media: string;
}

Style :: string;

Summary :: struct {
	global_attributes : []Attribute;
	content: []Summary_Content;
}
Summary_Content :: struct {
	using phrasing: Phrasing;
	using heading: Heading;
}

/********** t **********/
Table :: struct {
	global_attributes : []Attribute;
	caption: Caption;
	colgroups: []Colgroup;
	heads: []Thead;
	bodies: []Tbody;
	no_body: []Tr;
	foot: Tfoot;
}

Tbody :: struct {
	global_attributes : []Attribute;
	rows: []Tr;
}

Tfoot :: struct {
	global_attributes : []Attribute;
	rows: []Tr;
}

Th :: struct {
	global_attributes : []Attribute;
	content: []Th_Content;
}
Th_Content :: struct {
	using only_flow: Only_Flow;
	using interactive: Flow_Interactive;
	using phrasing: Phrasing;
}

Thead :: struct {
	global_attributes : []Attribute;
	tr: Tr;
}

Td :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

Tr :: struct {
	global_attributes : []Attribute;
	cells: []Tr_Content;
}
Tr_Content :: struct {
	tr: Tr;
	th: Th;
}

Title :: string;

/********** u **********/
Ul :: struct {
	global_attributes : []Attribute;
	content: []Flow;
}

/********** v **********/
/********** w **********/
/********** x **********/

/********** * **********/
Attribute :: struct {
	attribute: string;
	value: string;
}
