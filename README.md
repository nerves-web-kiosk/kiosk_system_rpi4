# Kiosk System for Raspberry Pi 4 Model B (64-bit)

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

## Running the Kiosk

The kiosk works by starting a
[weston](https://gitlab.freedesktop.org/wayland/weston) instance and then launching
a [cog](https://github.com/Igalia/cog) browser inside weston at a designated
url. Roughly it looks like this:

```sh
$ ssh nerves.local
> cmd("mkdir /tmp/xdg")
> cmd("chmod 700 /tmp/xdg")
> cmd("XDG_RUNTIME_DIR=/tmp/xdg weston --tty=1 &")
> cmd("udevd -d")
> cmd("udevadm trigger --type=subsystems --action=add")
> cmd("udevadm trigger --type=devices --action=add")
> cmd("udevadm settle --timeout=30")
> cmd("XDG_RUNTIME_DIR=/tmp/xdg WAYLAND_DISPLAY=wayland-1 cog --platform=wl http://info.cern.ch &")
```

Plug in a keyboard and display and you should see the home of the first website
as long as you have internet.

For use with this system there are some libraries that make running weston and cog easier, they are:

- [nerves_weston](https://github.com/coop/nerves_weston)
- [nerves_cog](https://github.com/coop/nerves_cog)

You can see an example of how to assemble them into a working kiosk in the
[example](/example) directory.
