# Changelog

This project does NOT follow semantic versioning. The version increases as
follows:

1. Major version updates are breaking updates to the build infrastructure.
   These should be very rare.
2. Minor version updates are made for every major Buildroot release. This
   may also include Erlang/OTP and Linux kernel updates. These are made four
   times a year shortly after the Buildroot releases.
3. Patch version updates are made for Buildroot minor releases, Erlang/OTP
   releases, and Linux kernel updates. They're also made to fix bugs and add
   features to the build infrastructure.

## v0.2.0

This is a Buildroot and Linux kernel update release.

* Updated dependencies
  * [nerves_system_br v1.29.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.29.1)
  * [Buildroot 2024.08.2](https://lore.kernel.org/buildroot/871pzex7gn.fsf@dell.be.48ers.dk/T/)
  * linux 6.6.51

## v0.1.2

This is a security/bug fix update.

* Updated dependencies
  * [nerves_system_br v1.28.3](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.28.3)
  * [Buildroot 2024.05.2](https://lore.kernel.org/buildroot/87zfpfh147.fsf@dell.be.48ers.dk/T/)

## v0.1.1

This is a security/bug fix update.

* Package updates
  * [nerves_system_br v1.28.2](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.28.2)
  * [Buildroot 2024.05.1](https://lore.kernel.org/buildroot/87ed7xfq78.fsf@dell.be.48ers.dk/T/)
  * [Erlang/OTP 27.0.1](https://erlang.org/download/OTP-27.0.1.README)

## v0.1.0

This is an initial release to make it easier for more people to test Nerves web
kiosks on the Raspberry Pi 5. Future releases will likely be incompatible to
expand the root filesystem and this one might have some frustrating bugs.
