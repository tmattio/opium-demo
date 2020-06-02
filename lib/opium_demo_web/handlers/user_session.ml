open Opium_kernel

let new_ _req =
  Lwt.return @@ Response.of_string_body (Views.User_session.new_ ()) ~code:`OK

let create _req =
  Lwt.return @@ Response.of_string_body "" ~code:`OK

let delete _req =
  Lwt.return @@ Response.of_string_body "" ~code:`OK
