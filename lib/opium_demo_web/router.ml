open Opium_kernel
open Handlers

let router = Router.create ()

(** The router of the application. It will try to match the requested URI with
    one of the defined route. If it finds a match, it will call the appropriate
    handler. If no route is found, it will call the default handler. *)
let m = Router.m router

let () =
  Router.scope
    router
    ~middlewares:Middlewares.[ User_auth.redirect_if_user_is_authenticated ]
    ~route:"/users"
    [ `GET, "/register", User_registration.new_
    ; `POST, "/register", User_registration.create
    ; `GET, "/login", User_session.new_
    ; `POST, "/login", User_session.create
    ; `GET, "/reset_password", User_reset_password.new_
    ; `POST, "/reset_password", User_reset_password.create
    ; `GET, "/reset_password/:token", User_reset_password.edit
    ; `PUT, "/reset_password/:token", User_reset_password.update
    ]

let () =
  Router.scope
    router
    ~middlewares:Middlewares.[ User_auth.require_authenticated_user ]
    ~route:"/users"
    [ `DELETE, "/logout", User_session.delete
    ; `GET, "/settings", User_settings.edit
    ; `PUT, "/settings/updated_password", User_settings.update_password
    ; `PUT, "/settings/updated_email", User_settings.update_email
    ; `PUT, "/settings/confirm_email/:token", User_settings.confirm_email
    ]

let () =
  Router.scope
    router
    ~middlewares:[]
    ~route:"/"
    [ `GET, "/users/confirm", User_confirmation.new_
    ; `POST, "/users/confirm", User_confirmation.create
    ; `GET, "/users/confirm/:token", User_confirmation.confirm
    ; `GET, "/", Page.index
    ]
