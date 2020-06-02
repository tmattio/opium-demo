open Opium_kernel

let new_ _req =
  Lwt.return
  @@ Response.of_string_body (Views.User_reset_password.new_ ()) ~code:`OK

let create _req =
  Lwt.return @@ Response.of_string_body "" ~code:`OK

let edit _req =
  Lwt.return
  @@ Response.of_string_body (Views.User_reset_password.edit ()) ~code:`OK

let update _req =
  Lwt.return @@ Response.of_string_body "" ~code:`OK
