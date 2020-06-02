open Tyxml.Html

let page_head ~title:title_s =
  head
    (title (txt title_s))
    [ meta ~a:[ a_charset "utf-8" ] ()
    ; meta
        ~a:
          [ a_name "viewport"
          ; a_content "width=device-width, initial-scale=1.0"
          ]
        ()
    ; meta
        ~a:
          [ a_name "description"
          ; a_content "Demo of a fullstack application with Opium"
          ]
        ()
    ; link ~rel:[ `Other "manifest" ] ~href:"manifest.json" ()
    ]

let page_body content = body [ main [ content ] ]

let make ?(title = "Opium Demo") content =
  html (page_head ~title) (page_body content)

let render document = document |> Format.asprintf "%a" (pp ())
