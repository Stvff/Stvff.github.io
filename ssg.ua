Buildfolder ← "build/"

# the titles
{"Stvff stuff" "ArbAsm" "Vanadis" "Dive" "Triops" "Drizzle" "Waterfall" "Sokoworm" "Math wishlist" "Thoughts on Typesetters" "Soggy" "Manyfold"}
# the descriptions
{"My portfolio website" "Arbitrary arithmetic scripting language" "Memory-oriented assembly style scripting language" "Typed language experiment" "Assembly macro language" "Music spectrograph" "Radio Spectrograph" "A game in 2488 bytes" "Unsolved math problems" "Is this the best we have?" "Simple windowing library" "Guarenteed-volume 3D modeling engine"}
# the content
{"index" "arbasm" "vanadis" "dive" "triops" "drizzle" "waterfall" "sokoworm" "wishlist" "typesetters" "soggy" "manyfold"}
⍚(⊂ : ".html")
⟜(⍚&fras

  # prepending the head and navbar
  ⍚(⊂ &fras "start2.html")
  ⍚(⊂⊂⊃⊂ "\"/>" "<meta name=\"description\" content=\"" :)
  ⍚(⊂⊂⊃⊂ "</title>" "<title>" :)
  ⍚(⊂ &fras "start1.html")

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
