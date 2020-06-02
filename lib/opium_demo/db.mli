(* Type aliases for the sake of documentation and explication *)

type 'err caqti_conn_pool =
  (Caqti_lwt.connection, ([> Caqti_error.connect ] as 'err)) Caqti_lwt.Pool.t

type ('res, 'err) query =
  Caqti_lwt.connection -> ('res, ([< Caqti_error.t ] as 'err)) Result.t Lwt.t

type ('res, 'err) query_result =
  ('res, ([> Caqti_error.call_or_retrieve ] as 'err)) Result.t Lwt.t

val query
  :  (Caqti_lwt.connection
      -> ( 'a
         , [< Caqti_error.t > `Connect_failed `Connect_rejected `Post_connect ]
         )
         Result.t
         Lwt.t)
  -> ('a, string) Lwt_result.t
(** [query_pool query pool] is the [Ok res] of the [res] obtained by executing
    the database [query], or else the [Error err] reporting the error causing
    the query to fail. *)
