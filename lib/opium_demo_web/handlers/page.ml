open Opium_kernel

let index _req = Lwt.return @@ Response.of_string_body (Views.Page.index ())
