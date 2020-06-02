open Opium_kernel

let new_ _req =
  Lwt.return
  @@ Response.of_string_body (Views.User_registration.new_ ()) ~code:`OK

let create _req =
  Lwt.return @@ Response.of_string_body "" ~code:`OK
