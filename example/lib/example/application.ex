defmodule Example.Application do
  use Application

  @xdg_runtime_dir "/run"

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Example.API, options: [port: 4000]},
      {NervesWeston,
       tty: 1,
       xdg_runtime_dir: @xdg_runtime_dir,
       name: :weston,
       daemon_opts: [log_output: :info, stderr_to_stdout: true],
       cli_args: ["--shell=kiosk-shell.so"]},
      {NervesCog,
       url: "http://localhost:4001/dev/dashboard/home",
       fullscreen: true,
       xdg_runtime_dir: @xdg_runtime_dir,
       wayland_display: "wayland-1",
       daemon_opts: [log_output: :info, stderr_to_stdout: true],
       name: :cog}
    ]

    opts = [strategy: :rest_for_one, name: Example.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
