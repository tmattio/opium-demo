open Tyxml.Html

let index () = h1 [ txt "Welcome !" ] |> Layout.make |> Layout.render

let not_found () =
  h1 [ txt "The page you're looking for cannot be found !" ]
  |> Layout.make
  |> Layout.render
