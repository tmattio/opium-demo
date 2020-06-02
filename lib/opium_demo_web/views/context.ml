type t = { current_user : Opium_demo.Accounts.User.t option }

let make ~current_user () = { current_user }
