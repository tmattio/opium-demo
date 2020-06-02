(lang dune 2.0)

(name opium-demo)

(source
 (github tmattio/opium-demo))

(license MIT)

(authors "Thibaut Mattio")

(maintainers "Thibaut Mattio")

(generate_opam_files true)

(allow_approximate_merlin)

(package
 (name opium-demo)
 (synopsis "Demo of a fullstack application with Opium")
 (description "Demo of a fullstack application with Opium")
 (depends
  (ocaml
   (>= 4.08.0))
  (dune
   (>= 2.0))
  (alcotest :with-test)
  (alcotest-lwt :with-test)
  (odoc :with-doc)
  (crunch :build)
  opium
  tyxml
  lwt
  ppx_rapper
  caqti
  caqti-lwt
  caqti-driver-postgresql))
