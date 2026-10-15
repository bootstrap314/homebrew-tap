# ac-man Homebrew tap

Install the macOS menu-bar app **and** the terminal CLI together:

```sh
brew trust --formula bootstrap314/tap/ac-man
brew install --cask bootstrap314/tap/ac-man
```

The first command approves the CLI dependency on Homebrew versions with tap trust enforcement. If your Homebrew does not have a `trust` command, skip that line. The cask then installs both components.

The cask installs `ac-man.app` into Applications and installs the CLI formula as a dependency. Open ac-man from Applications; use `ac-man` in Terminal. The app requires an Apple Silicon Mac running macOS 13 or later. Both downloads come from the signed v0.0.2 release; the app and DMG are Developer ID signed and notarized. The CLI tarballs are verified with SHA-256 checksums.

For CLI-only installation on Apple Silicon, Intel Mac, or Linux x86_64:

```sh
brew install --formula bootstrap314/tap/ac-man
```

The Linux CLI requires glibc 2.36 or newer and a D-Bus session with a Secret Service credential store for login.

## Update

```sh
brew update
brew upgrade --cask bootstrap314/tap/ac-man
brew upgrade --formula bootstrap314/tap/ac-man
```

## Project

[ac-man source, documentation, and releases](https://github.com/bootstrap314/ac-man)

Licensed under Apache-2.0. Uninstalling the cask does not delete shared account credentials or local device labels.
