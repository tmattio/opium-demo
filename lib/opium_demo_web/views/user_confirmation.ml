open Tyxml.Html

let new_ () = h1 [ txt "User confirmation" ] |> Layout.make |> Layout.render
