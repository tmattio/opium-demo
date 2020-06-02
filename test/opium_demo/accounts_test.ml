open Alcotest_lwt
open Opium_demo

let test_dummy _switch () = Lwt.return ()

let suite =
  [ ( "get_user_by_email"
    , [ test_case
          "does not return the user if the email does not exist"
          `Quick
          test_dummy
      ; test_case "returns the user if the email exists" `Quick test_dummy
      ] )
  ; ( "get_user_by_email_and_password"
    , [ test_case
          "does not return the user if the email does not exist"
          `Quick
          test_dummy
      ; test_case
          "does not return the user if the password is not valid"
          `Quick
          test_dummy
      ; test_case
          "returns the user if the email and password are valid"
          `Quick
          test_dummy
      ] )
  ; ( "get_user_by_id"
    , [ test_case "raises if id is invalid" `Quick test_dummy
      ; test_case "returns the user with the given id" `Quick test_dummy
      ] )
  ; ( "register_user"
    , [ test_case "requires email and password to be set" `Quick test_dummy
      ; test_case "validates email and password when given" `Quick test_dummy
      ; test_case
          "validates maximum values for e-mail and password for security"
          `Quick
          test_dummy
      ; test_case "validates e-mail uniqueness" `Quick test_dummy
      ; test_case "registers users with a hashed password" `Quick test_dummy
      ] )
  ; ( "apply_user_email"
    , [ test_case "requires email to change" `Quick test_dummy
      ; test_case "validates email" `Quick test_dummy
      ; test_case
          "validates maximum value for e-mail for security"
          `Quick
          test_dummy
      ; test_case "validates e-mail uniqueness" `Quick test_dummy
      ; test_case "validates current password" `Quick test_dummy
      ; test_case "applies the e-mail without persisting it" `Quick test_dummy
      ] )
  ; ( "deliver_update_email_instructions"
    , [ test_case "sends token through notification" `Quick test_dummy ] )
  ; ( "update_user_email"
    , [ test_case "updates the e-mail with a valid token" `Quick test_dummy
      ; test_case "does not update e-mail with invalid token" `Quick test_dummy
      ; test_case
          "does not update e-mail if user e-mail changed"
          `Quick
          test_dummy
      ; test_case "does not update e-mail if token expired" `Quick test_dummy
      ] )
  ; ( "update_user_password"
    , [ test_case "validates password" `Quick test_dummy
      ; test_case
          "validates maximum values for password for security"
          `Quick
          test_dummy
      ; test_case "validates current password" `Quick test_dummy
      ; test_case "updates the password" `Quick test_dummy
      ; test_case "deletes all tokens for the given user" `Quick test_dummy
      ] )
  ; ( "generate_session_token"
    , [ test_case "generates a token" `Quick test_dummy ] )
  ; ( "get_user_by_session_token"
    , [ test_case "returns user by token" `Quick test_dummy
      ; test_case "does not return user for invalid token" `Quick test_dummy
      ; test_case "does not return user for expired token" `Quick test_dummy
      ] )
  ; "delete_session_token", [ test_case "deletes the token" `Quick test_dummy ]
  ; ( "deliver_user_confirmation_instructions"
    , [ test_case "sends token through notification" `Quick test_dummy ] )
  ; ( "confirm_user"
    , [ test_case "confirms the e-mail with a valid token" `Quick test_dummy
      ; test_case "does not confirm with invalid token" `Quick test_dummy
      ; test_case "does not confirm e-mail if token expired" `Quick test_dummy
      ] )
  ; ( "deliver_user_reset_password_instructions"
    , [ test_case "sends token through notification" `Quick test_dummy ] )
  ; ( "get_user_by_reset_password_token"
    , [ test_case "returns the user with valid token" `Quick test_dummy
      ; test_case
          "does not return the user with invalid token"
          `Quick
          test_dummy
      ; test_case "does not return the user if token expired" `Quick test_dummy
      ] )
  ; ( "reset_user_password"
    , [ test_case "validates password" `Quick test_dummy
      ; test_case
          "validates maximum values for password for security"
          `Quick
          test_dummy
      ; test_case "updates the password" `Quick test_dummy
      ; test_case "deletes all tokens for the given user" `Quick test_dummy
      ] )
  ; "inspect", [ test_case "does not include password" `Quick test_dummy ]
  ]

let () = Lwt_main.run @@ run "app - Accounts" suite
