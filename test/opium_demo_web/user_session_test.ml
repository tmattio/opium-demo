open Alcotest_lwt
open Opium_kernel
open Opium_demo_web

let test_dummy _switch () = Lwt.return ()

let suite =
  [ ( "GET users login"
    , [ test_case "renders login page" `Quick test_dummy
      ; test_case "redirects if already logged in" `Quick test_dummy
      ] )
  ; ( "POST users login"
    , [ test_case "logs the user in" `Quick test_dummy
      ; test_case "logs the user in with remember me" `Quick test_dummy
      ; test_case
          "emits error message with invalid credentials"
          `Quick
          test_dummy
      ] )
  ; ( "DELETE users logout"
    , [ test_case "redirects if not logged in" `Quick test_dummy
      ; test_case "logs the user out" `Quick test_dummy
      ] )
  ]

let () = Lwt_main.run @@ run "app-web - User Session Handler" suite
