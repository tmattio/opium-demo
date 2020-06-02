open Alcotest_lwt
open Opium_kernel
open Opium_demo_web

let test_dummy _switch () = Lwt.return ()

let suite =
  [ ( "GET users register"
    , [ test_case "renders registration page" `Quick test_dummy
      ; test_case "redirects if already logged in" `Quick test_dummy
      ] )
  ; ( "POST users register"
    , [ test_case "creates account and logs the user in" `Quick test_dummy
      ; test_case "render errors for invalid data" `Quick test_dummy
      ] )
  ]

let () = Lwt_main.run @@ run "app-web - User Registration Handler" suite
