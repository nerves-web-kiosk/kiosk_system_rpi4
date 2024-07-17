defmodule Example.MixProject do
  use Mix.Project

  @app :example
  @version "0.1.0"
  @all_targets [:rpi4]

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.11",
      archives: [nerves_bootstrap: "~> 1.12"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [{@app, release()}],
      preferred_cli_target: [run: :host, test: :host]
    ]
  end

  def application do
    [
      mod: {Example.Application, []},
      extra_applications: [:logger, :runtime_tools, :os_mon]
    ]
  end

  defp deps do
    [
      # Dependencies for all targets
      {:nerves, "~> 1.7.16 or ~> 1.8", runtime: false},
      {:shoehorn, "~> 0.9"},
      {:ring_logger, "~> 0.8"},
      {:toolshed, "~> 0.2"},

      # Allow Nerves.Runtime on host to support development, testing and CI.
      # See config/host.exs for usage.
      {:nerves_runtime, "~> 0.13.0"},
      {:plug_cowboy, "~> 2.0"},
      {:nerves_weston, github: "fhunleth/nerves_weston"},
      {:nerves_cog, git: "https://github.com/coop/nerves_cog.git"},
      {:nerves_ssh, git: "https://github.com/nerves-project/nerves_ssh.git", override: true},

      # Dependencies for all targets except :host
      {:nerves_pack, "~> 0.7.0", targets: @all_targets},
      {:example_ui, path: "../example_ui", targets: @all_targets, env: Mix.env()},

      # Dependencies for specific targets
      {:kiosk_system_rpi4, "~> 0.1.0", runtime: false, targets: :rpi4}
    ]
  end

  def release do
    [
      overwrite: true,
      # Erlang distribution is not started automatically.
      # See https://hexdocs.pm/nerves_pack/readme.html#erlang-distribution
      cookie: "#{@app}_cookie",
      include_erts: &Nerves.Release.erts/0,
      steps: [&Nerves.Release.init/1, :assemble],
      strip_beams: Mix.env() == :prod or [keep: ["Docs"]]
    ]
  end
end
