(* For simplicity, this module simply logs messages to the terminal.

   You should replace it by a proper e-mail or notification tool. *)

let deliver email body = ()

(** Deliver instructions to confirm account. *)
let deliver_confirmation_instructions (user : User.t) ~url =
  deliver
    user.email
    {|

    ==============================

    Hi #{user.email},

    You can confirm your account by visiting the url below:

    #{url}

    If you didn't create an account with us, please ignore this.

    ==============================
    |}

(** Deliver instructions to reset password account. *)
let deliver_reset_password_instructions (user : User.t) ~url =
  deliver
    user.email
    {|

    ==============================

    Hi #{user.email},

    You can reset your password by visiting the url below:

    #{url}

    If you didn't create an account with us, please ignore this.

    ==============================
    |}

(** Deliver instructions to update your e-mail. *)
let deliver_update_email_instructions (user : User.t) ~url =
  deliver
    user.email
    {|
      
    ==============================

    Hi #{user.email},

    You can change your e-mail by visiting the url below:

    #{url}

    If you didn't create an account with us, please ignore this.

    ==============================
    |}
