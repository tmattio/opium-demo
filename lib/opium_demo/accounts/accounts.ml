(** The Accounts context. *)

module User_notifier = User_notifier
module User_token = User_token
module User = User

(* Database getters *)

(** Gets a user by email.

    {4 Examples}

    {[
      get_user_by_email "foo@example.com"
      _ : (User.t, string) Lwt_result.t = Ok { name = "Tom" ; age = 25 }

      get_user_by_email "unknown@example.com"
      _ : (User.t, string) Lwt_result.t = Error "not found"
    ]} *)
let get_user_by_email email : (User.t, string) Lwt_result.t =
  let open Lwt_result.Syntax in
  let open User in
  let request =
    [%rapper
      get_one
        {sql|
        SELECT @Email{email}
        FROM users
        WHERE email = %Email{email}
        |sql}
        record_out]
  in
  Db.query (fun c -> request c email)

(** Gets a user by email and password.

    {4 Examples}

    {[
      get_user_by_email_and_password ~email:"foo@example.com" ~password:"correct_password"
      _ : (User.t, string) Lwt_result.t = Ok { name = "Tom" ; age = 25 }

      get_user_by_email_and_password ~email:"unknown@example.com" ~password:"invalid_password"
      _ : (User.t, string) Lwt_result.t = Error "invalid password"
    ]} *)
let get_user_by_email_and_password ~email ~password = ()

(** Gets a user by ID.

    {4 Examples}

    {[
      get_user_by_id 123
      _ : (User.t, string) Lwt_result.t = Ok { name = "Tom" ; age = 25 }

      get_user_by_id 456
      _ : (User.t, string) Lwt_result.t = Error "not found"
    ]} *)
let get_user_by_id id =
  let open Lwt_result.Syntax in
  let open User in
  let request =
    [%rapper
      get_one
        {sql|
        SELECT @Email{email}
        FROM users
        WHERE id = %int{id}
        |sql}
        record_out]
  in
  Db.query (fun c -> request c id)

(** Registers a user.

    {4 Examples}

    {[
      register_user ~email ~password ~password_confirmation
      _ : (User.t, string) Lwt_result.t = Ok { name = "Tom" ; age = 25 }

      register_user ~email ~password ~password_confirmation
      _ : (User.t, string) Lwt_result.t = Error "invalid user"
    ]} *)
let register_user ~email ~password ~password_confirmation = ()

(* Settings *)

(** Emulates that the e-mail will change without actually changing it in the
    database.

    {4 Examples}

    {[
      apply_user_email user ~password:"valid password" ~email:"foo@example.com"
      _ : (User.t, string) Lwt_result.t = Ok { name = "Tom" ; age = 25 }

      apply_user_email user ~password:"invalid password" ~email:"foo@example.com"
      _ : (User.t, string) Lwt_result.t = Error "invalid password"
    ]} *)
let apply_user_email user ~password ~email = ()

(** Updates the user e-mail in token.

    If the token matches, the user email is updated and the token is deleted.
    The confirmed_at date is also updated to the current time. *)
let update_user_email user ~token = ()

(** Delivers the update e-mail instructions to the given user. *)
let deliver_update_email_instructions user ~current_email ~update_email_url_fn =
  ()

(** Updates the user password.

    {4 Examples}

    {[
      update_user_password user ~password:"valid password"
      _ : (User.t, string) Lwt_result.t = Ok { name = "Tom" ; age = 25 }

      update_user_password user ~password:"invalid password"
      _ : (User.t, string) Lwt_result.t = Error "invalid password"
    ]} *)
let update_user_password user ~password ~new_password ~new_password_confirmation
  =
  ()

(* Session *)

(** Generates a session token. *)
let generate_session_token user = ()

(** Gets the user with the given signed token. *)
let get_user_by_session_token token = ()

(** Deletes the signed token with the given context. *)
let delete_session_token token = ()

(* Confirmation *)

(** Delivers the confirmation e-mail instructions to the given user. *)
let deliver_user_confirmation_instructions user ~confirmation_url_fn = ()

(** Confirms a user by the given token.

    If the token matches, the user account is marked as confirmed and the token
    is deleted. *)
let confirm_user token = ()

(* Reset password *)

(** Delivers the reset password e-mail to the given user. *)
let deliver_user_reset_password_instructions user ~reset_password_url_fn = ()

(** Gets the user by reset password token.

    {4 Examples}

    {[
      get_user_by_reset_password_token "validtoken"
      _ : (User.t, string) Lwt_result.t = Ok { name = "Tom" ; age = 25 }

      get_user_by_reset_password_token "invalidtoken"
      _ : (User.t, string) Lwt_result.t = Error "invalid token"
    ]} *)
let get_user_by_reset_password_token token = ()

(** Resets the user password.

    {4 Examples}

    {[
      reset_user_password user ~password:"new password" ~password_confirmation:"new password"
      _ : (User.t, string) Lwt_result.t = Ok { name = "Tom" ; age = 25 }

      reset_user_password user ~password:"valid" ~password_confirmation:"not the same"
      _ : (User.t, string) Lwt_result.t = Error "passwords do not match"
    ]} *)
let reset_user_password user ~password ~password_confirmation = ()
