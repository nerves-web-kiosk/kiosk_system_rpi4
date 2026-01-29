# Kiosk System for Raspberry Pi 4 Model B (64-bit)

[![Hex version](https://img.shields.io/hexpm/v/kiosk_system_rpi4.svg "Hex version")](https://hex.pm/packages/kiosk_system_rpi4)
[![CI](https://github.com/nerves-web-kiosk/kiosk_system_rpi4/actions/workflows/ci.yml/badge.svg)](https://github.com/nerves-web-kiosk/kiosk_system_rpi4/actions/workflows/ci.yml)
[![REUSE status](https://api.reuse.software/badge/github.com/nerves-web-kiosk/kiosk_system_rpi4)](https://api.reuse.software/info/github.com/nerves-web-kiosk/kiosk_system_rpi4)

*This is the v0 maintenance branch. It is still maintained and is the
recommended branch for most users. Active development is in the `main` branch.*

This is a specialised version of the
[nerves_system_rpi4](https://github.com/nerves-project/nerves_system_rpi4) that
includes the required packages to run a fullscreen web browser in kiosk mode.

This is a work-in-progress to bring a maintained open source web kiosk back to
Nerves. Thanks to the following people and their code that they shared:

- [Tim Cooper's RPi4 Kiosk](https://github.com/coop/kiosk_system_rpi4)
- [Tom Winkler's reTerminal DM Kiosk](https://github.com/formrausch/frio_rpi4)

The documentation here is out of date, but the example works.

## Using

The most common way of using this Nerves System is create a project with `mix
nerves.new my_kiosk_app --target rpi4` and to export `MIX_TARGET=rpi4`.

Then, change the rpi4 system dependency to `{:kiosk_system_rpi4, "~> 0.1.0",
runtime: false, target: :rpi4}`.

## Kiosk Example

Please see the
[kiosk_example](https://github.com/nerves-web-kiosk/kiosk_example) project for
an example of how to use this in a Nerves project.
