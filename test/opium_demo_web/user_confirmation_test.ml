open Alcotest_lwt
open Opium_kernel
open Opium_demo_web

let test_dummy _switch () = Lwt.return ()

let suite =
  [ ( "GET users confirm"
    , [ test_case "renders the confirmation page" `Quick test_dummy ] )
  ; ( "POST users confirm"
    , [ test_case "sends a new confirmation token" `Quick test_dummy
      ; test_case
          "does not send confirmation token if account is confirmed"
          `Quick
          test_dummy
      ; test_case
          "does not send confirmation token if email is invalid"
          `Quick
          test_dummy
      ] )
  ; ( "GET users confirm :token"
    , [ test_case "confirms the given token once" `Quick test_dummy
      ; test_case "does not confirm email with invalid token" `Quick test_dummy
      ] )
  ]

let () = Lwt_main.run @@ run "app-web - User Confirmation Handler" suite
