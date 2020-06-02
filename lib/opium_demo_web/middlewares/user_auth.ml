open Opium_kernel

let require_authenticated_user =
  let filter handler req = handler req in
  Rock.Middleware.create ~name:"Require authenticated user" ~filter

let redirect_if_user_is_authenticated =
  let filter handler req = handler req in
  Rock.Middleware.create ~name:"Redirect if user is authenticated" ~filter

let fetch_current_user =
  let filter handler req = handler req in
  Rock.Middleware.create ~name:"Fetch current user" ~filter
