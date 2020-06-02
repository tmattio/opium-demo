open Tyxml.Html

let new_ () = h1 [ txt "User session" ] |> Layout.make |> Layout.render
