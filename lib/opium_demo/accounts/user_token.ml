module Config = struct
  let hash_algorithm = `Sha256

  let rand_size = 32

  (* It is very important to keep the reset password token expiry short, since
     someone with access to the e-mail may take over the account. *)
  let reset_password_validity_in_days = 1

  let confirm_validity_in_days = 7

  let change_email_validity_in_days = 7

  let session_validity_in_days = 60
end

type t =
  { token : Bytes.t
  ; context : string
  ; send_to : string
  }

(** Generates a token that will be stored in a signed place, such as session or
    cookie. As they are signed, those tokens do not need to be hashed. *)
let build_session_token user = ()

(** Checks if the token is valid and returns its underlying lookup query. The
    query returns the user found by the token. *)
let verify_session_token_query token = ()

(** Builds a token with a hashed counter part.

    The non-hashed token is sent to the user e-mail while the hashed part is
    stored in the database, to avoid reconstruction. The token is valid for a
    week as long as users don't change their email. *)
let build_user_email_token user ~context = ()

(** Checks if the token is valid and returns its underlying lookup query. The
    query returns the user found by the token. *)
let verify_user_email_token_query token ~context = ()

(** Checks if the token is valid and returns its underlying lookup query. The
    query returns the user found by the token. *)
let verify_user_change_email_token_query token ~context = ()
