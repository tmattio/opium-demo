let rock = Opium_demo_web.app

let app =
  let app = Opium.App.empty in
  List.fold_right
    (Opium_kernel.Rock.App.middlewares rock)
    ~init:app
    ~f:(fun m app -> Opium.App.middleware m app)
  |> Opium.App.not_found (Opium_kernel.Rock.App.handler rock)
  |> Opium.App.cmd_name "Opium Demo"

let log_level = Logs.Debug

let () =
  Logs.set_reporter (Logs_fmt.reporter ());
  Logs.set_level (Some log_level);
  Opium.App.run_command app
