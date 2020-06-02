open Opium_kernel

module Config = struct
  let max_age = 60 * 60 * 24 * 60

  let remember_me_cookie = "user_remember_me"

  (* @remember_me_options [sign: true, max_age: @max_age] *)
  let remember_me_options = ()
end

let login_user _req =
  Lwt.return @@ Response.of_string_body "" ~code:`OK

let logout_user _req =
  Lwt.return @@ Response.of_string_body "" ~code:`OK
