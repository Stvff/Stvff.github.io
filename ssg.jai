main :: () {
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
			content = .[
				next_h(s("Biiiigg Stretch")),
				p(s("The mitochondria is the powerhouse of the cell")),
				p(s("also, dorime"), attr = .[is("chart"), is("class", "cool")]),
			]
		}
	};

	sb: String_Builder;
	make(*sb, page);
	print(builder_to_string(*sb));
}

#import "html";
#import "Basic";
