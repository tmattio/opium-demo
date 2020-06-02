open Tyxml.Html

let new_ () = h1 [ txt "User registration" ] |> Layout.make |> Layout.render
