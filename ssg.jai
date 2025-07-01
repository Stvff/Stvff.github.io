main :: () {
main_content := Flow.[
hgroup(
	next_h(s("Vitreous Stuff"), attr = .[is("id", "top")]).h,
	p(a("https://en.wiktionary.org/wiki/vitreous", s("Made of, or resembling glass."), target = "_blank"), s(" Not in brittleness, but in clarity.")).p
),
p(
	s("Good evening! I go by Stvff online, and I've been programming in one way or another for roughly 6 years. "),
	s("My first language was TI-BASIC on the TI-84CE, and nowadays I have plenty of experience with Odin, C, Go, Processing, as well as many other languages and platforms."), br(),
	s("Once someone learns to program, language becomes an implementation detail.")
),
p(s("also, dorime"), attr = .[is("chart"), is("class", "cool")]),

nest_h(s("Website overview")),


];


page := HTML.{
	lang = "en-CA",
	head = .{
		metadata = .[
			.{meta = attrs(.{"charset", "utf-8"})},
			.{meta = attrs(.{"name", "author"}, .{"content", "stvff"})},
			.{style = ".cool{color:red;}"},
		],
		title = "Titular"
	},
	body = .{
		content = main_content
	}
};

sb: String_Builder;
make(*sb, page);
print(builder_to_string(*sb));
}

#import "html";
#import "Basic";
