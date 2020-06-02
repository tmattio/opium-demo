open Alcotest
open Opium_kernel
open Lwt.Infix

let check_handler_body ~request ~expected handler =
  handler request >>= fun response ->
  Response.body response |> Cohttp_lwt.Body.to_string >|= fun body ->
  check string "same string" body expected
