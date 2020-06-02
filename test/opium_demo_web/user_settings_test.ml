open Alcotest_lwt
open Opium_kernel
open Opium_demo_web

let test_dummy _switch () = Lwt.return ()

let suite =
  [ ( "GET users settings"
    , [ test_case "renders settings page" `Quick test_dummy
      ; test_case "redirects if user is not logged in" `Quick test_dummy
      ] )
  ; ( "PUT users settings update_password"
    , [ test_case
          "updates the user password and resets tokens"
          `Quick
          test_dummy
      ; test_case "does not update password on invalid data" `Quick test_dummy
      ] )
  ; ( "PUT users settings update_email"
    , [ test_case "updates the user email" `Quick test_dummy
      ; test_case "does not update email on invalid data" `Quick test_dummy
      ] )
  ; ( "GET users settings confirm_email :token"
    , [ test_case "updates the user email once" `Quick test_dummy
      ; test_case "does not update email with invalid token" `Quick test_dummy
      ; test_case "redirects if user is not logged in" `Quick test_dummy
      ] )
  ]

let () = Lwt_main.run @@ run "app-web - User Settings Handler" suite
