open Alcotest_lwt
open Opium_kernel
open Opium_demo_web

let test_dummy _switch () = Lwt.return ()

let suite =
  [ ( "GET users reset_password"
    , [ test_case "renders the reset password page" `Quick test_dummy ] )
  ; ( "POST users reset_password"
    , [ test_case "sends a new reset password token" `Quick test_dummy
      ; test_case
          "does not send reset password token if email is invalid"
          `Quick
          test_dummy
      ] )
  ; ( "GET users reset_password :token"
    , [ test_case "renders reset password" `Quick test_dummy
      ; test_case
          "does not render reset password with invalid token"
          `Quick
          test_dummy
      ] )
  ; ( "PUT users reset_password :token"
    , [ test_case "resets password once" `Quick test_dummy
      ; test_case "does not reset password on invalid data" `Quick test_dummy
      ; test_case "does not reset password with invalid token" `Quick test_dummy
      ] )
  ]

let () = Lwt_main.run @@ run "app-web - User Reset_password Handler" suite
