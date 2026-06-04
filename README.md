# Homebrew Taps

!\[from macOS 15]\(<https://img.shields.io/badge/macOS-15.0+-blue.svg> null)

A Homebrew tap containing custom casks for macOS applications.

## Installation

### Homebrew (macOS)

```bash
brew tap yu-7/unsigned
```

The app will be automatically configured to run without security warnings.

## Test in local

```bash
# when you add new casks, you need to update the tap first.
brew update

# in this tap, most of casks are auto_updates enabled
# so you must use  `--greedy` to check the outdated casks and upgrade them.
brew outdated --cask --greedy
brew upgrade --cask --greedy
```

