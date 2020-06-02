type 'err caqti_conn_pool =
  (Caqti_lwt.connection, ([> Caqti_error.connect ] as 'err)) Caqti_lwt.Pool.t

type ('res, 'err) query =
  Caqti_lwt.connection -> ('res, ([< Caqti_error.t ] as 'err)) Result.t Lwt.t

type ('res, 'err) query_result =
  ('res, ([> Caqti_error.call_or_retrieve ] as 'err)) Result.t Lwt.t

let connect () =
  Config.connection_uri |> Uri.of_string |> Caqti_lwt.connect_pool ~max_size:10
  |> function
  | Ok pool ->
    pool
  | Error err ->
    failwith (Caqti_error.show err)

let pool = connect ()

let query query =
  Caqti_lwt.Pool.use query pool |> Lwt_result.map_err Caqti_error.show
