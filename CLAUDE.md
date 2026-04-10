# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Homebrew tap repository containing custom casks for macOS applications. The key feature of this tap is that it automatically configures apps to run without macOS security warnings by removing the quarantine attribute.

## Repository Structure

- `Casks/` - Directory containing all Homebrew cask files (*.rb)
- `README.md` - Project documentation and installation instructions

## Cask File Pattern

All casks in this repository follow a consistent pattern:

1. **Architecture support**: Each cask supports both ARM (Apple Silicon) and Intel architectures
2. **Version & SHA256**: Specify version and corresponding SHA256 hashes for both architectures
3. **GitHub Releases**: Most apps are downloaded from GitHub releases
4. **Postflight script**: Automatically removes quarantine attribute using `xattr -rd com.apple.quarantine`
5. **Zap trash**: Configures cleanup of application files when uninstalling with `brew zap`

## Common Tasks

### Adding a New Cask

1. Create a new `.rb` file in the `Casks/` directory following the existing pattern
2. Include the mandatory `postflight` block to remove quarantine attributes
3. Add `zap trash` configuration for proper cleanup

### Testing Casks Locally

```bash
# Install the tap locally
brew tap YU-7/unsigned

# Test a specific cask
brew install --cask <cask-name>
```

### Updating a Cask

#### Manual Update
When updating an app version:
1. Update the `version` field
2. Download the new binaries for both architectures
3. Calculate new SHA256 hashes using `shasum -a 256 <file>`
4. Update the `sha256` field for both architectures

#### Automatic Update via GitHub Actions

This repository is configured with GitHub Actions to automatically check for updates daily:

- The workflow is defined in `.github/workflows/update-casks.yml`
- It runs every day at midnight UTC
- It uses `brew livecheck` to detect new versions
- When updates are found, it automatically downloads new binaries, calculates SHA256 hashes, and creates a pull request

To manually trigger the update check:
1. Go to the GitHub repository page
2. Click "Actions" tab
3. Select "Update Casks" workflow
4. Click "Run workflow"
