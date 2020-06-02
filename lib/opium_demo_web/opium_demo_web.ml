(** Entrypoint to Opium Demo's web library. *)

module Handlers = Handlers
module Middlewares = Middlewares
module Views = Views
module Router = Router

(** [handler] is the server default handler. When a request is received, it is
    piped through the middlewares and eventually gets routed to the appropriate
    handler by the router middleware [Router.m]. In the case where the router
    middleware fails to match the request with a route, the default handler is
    used a fallback. In our case, every route that is not handled by the server
    will be handled by the frontend application. *)
let handler _req =
  Lwt.return @@ Opium_kernel.Response.of_string_body (Views.Page.not_found ())

(** [middlewares] is the list of middlewares used by every endpoints of the
    application's API. Most of the time, middlewares are scoped to a set of
    routes. Scoped middlewares should be added to the router ([Router.m]). But
    in situation where you want to pipe every incoming requests through a
    middleware (e.g. to globally reject a User-Agent), you can add the
    middleware to this list. *)
let middlewares = [ Router.m; Opium_kernel.Middleware.logger () ]

(** [app] represents our web application as list of middleware and an handler.
    It is meant to be used from a Cohttp server. If you're using Unix as a
    backend, you can use use transform the [Opium_kernel.Rock.App] to an
    [Opium.App] and serve it with [Opium.App.run_command] *)
let app = Opium_kernel.Rock.App.create ~middlewares ~handler
