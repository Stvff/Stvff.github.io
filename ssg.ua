Buildfolder ← "build/"

# getting the content
{"index" "typesetters" "arbasm" "vanadis" "dive" "triops" "waterfall" "wishlist" "drizzle" "soggy"}
⍚(⊂ : ".html")
⟜(⍚&fras

  # prepending the head and navbar
  ⍚(⊂ &fras "start.html")

  # appending the tail
  ⍚(⊂ : "<footer><small>Copyright © current year. All rights reserved.</small></footer></main></body></html>")
)

# writing
&fmd Buildfolder
⍚(⊂ Buildfolder)
≡(⍚&fwa)

# copying over the css file
⟜&fras "styles.css"
&fwa ⊂ Buildfolder

# copying over the assets
&fld &fmd ⊂ Buildfolder . "assets/"
⟜(⍚&frab)
⍚(⊂ Buildfolder)
⍚&fwa
