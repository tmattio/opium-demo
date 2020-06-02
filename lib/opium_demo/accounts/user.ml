module Email : sig
  type t

  val of_string : string -> (t, string) result

  val to_string : t -> string

  val t : t Caqti_type.t
end = struct
  type t = string

  let of_string s = Ok s

  let to_string s = s

  (* validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign
     and no spaces") *)
  (* validate_length(:email, max: 160) *)
  let validate s =
    let ( let* ) = Result.bind in
    let* s =
      let regexp = Str.regexp "^[^\\s]+@[^\\s]+$" in
      if Str.string_match regexp s 0 then
        Ok s
      else
        Error "The email is not valid"
    in
    if String.length s < 255 then
      Ok s
    else
      Error "The email must be less than 255 characters"

  let t =
    Caqti_type.(
      custom ~encode:of_string ~decode:(fun el -> Ok (to_string el)) string)
end

module Password : sig
  type t

  val of_string : string -> t

  val to_string : t -> string
end = struct
  type t = string

  let of_string s = s

  let to_string s = s

  (* validate_length(:password, min: 12, max: 80) *)
  let validate s = Ok s

  let hash s = s
end

type t = { email : Email.t }

(** Registers a new user.

    It is important to validate the length of both e-mail and password.
    Otherwise databases may truncate the e-mail without warnings, which could
    lead to unpredictable or insecure behaviour. Long passwords may also be very
    expensive to hash for certain algorithms. *)
let register ~email ~password = ()

(** Updates the user email.

    It requires the e-mail to change otherwise an error is added. *)
let update_email user ~email = ()

(** Updates the user password. *)
let update_password user ~password = ()

(** Confirms the account by setting `confirmed_at`. *)
let confirm user = ()

(** Verifies the password.

    Returns the given user if valid, If there is no user or the user doesn't
    have a password, we still run the password hash function with a blank
    password to avoid timing attacks. *)
let is_password_valid user ~password = ()
