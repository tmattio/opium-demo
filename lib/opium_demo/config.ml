(** Configuration of the database *)

let url = Sys.getenv_opt "OPIUM_DEMO_DB_HOST" |> Option.value ~default:"localhost"

let port =
  Sys.getenv_opt "OPIUM_DEMO_DB_PORT"
  |> Option.map int_of_string
  |> Option.value ~default:5432

let database =
  Sys.getenv_opt "OPIUM_DEMO_DB_DATABASE" |> Option.value ~default:"opium-demo"

let connection_uri = Printf.sprintf "postgresql://%s:%i/%s" url port database
