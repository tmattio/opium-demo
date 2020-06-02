open Opium_kernel

let edit _req =
  Lwt.return @@ Response.of_string_body (Views.User_settings.edit ()) ~code:`OK

let update_email _req = Lwt.return @@ Response.of_string_body "" ~code:`OK

let confirm_email _req = Lwt.return @@ Response.of_string_body "" ~code:`OK

let update_password _req = Lwt.return @@ Response.of_string_body "" ~code:`OK
