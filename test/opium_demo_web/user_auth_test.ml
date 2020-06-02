open Alcotest_lwt
open Opium_kernel
open Opium_demo_web

let test_dummy _switch () = Lwt.return ()

let suite =
  [ ( "login_user"
    , [ test_case "stores the user token in the session" `Quick test_dummy
      ; test_case
          "clears everything previously stored in the session"
          `Quick
          test_dummy
      ; test_case "redirects to the configured path" `Quick test_dummy
      ; test_case
          "writes a cookie if remember_me is configured"
          `Quick
          test_dummy
      ] )
  ; ( "logout_user"
    , [ test_case "erases session and cookies" `Quick test_dummy
      ; test_case "works even if user is already logged out" `Quick test_dummy
      ] )
  ; ( "fetch_current_user"
    , [ test_case "authenticates user from session" `Quick test_dummy
      ; test_case "authenticates user from cookies" `Quick test_dummy
      ; test_case "does not authenticate if data is missing" `Quick test_dummy
      ] )
  ; ( "redirect_if_user_is_authenticated"
    , [ test_case "redirects if user is authenticated" `Quick test_dummy
      ; test_case
          "does not redirect if user is not authenticated"
          `Quick
          test_dummy
      ] )
  ; ( "require_authenticated_user"
    , [ test_case "redirects if user is not authenticated" `Quick test_dummy
      ; test_case "stores the path to redirect to on GET" `Quick test_dummy
      ; test_case
          "does not redirect if user is not authenticated"
          `Quick
          test_dummy
      ] )
  ]

let () = Lwt_main.run @@ run "app-web - User Auth Handler" suite
