# homebrew-tap

Personal [Homebrew](https://brew.sh) tap for tools by
[@mathiasror](https://github.com/mathiasror).

## Formulae

| Formula       | What it is                                                   | Upstream |
| ------------- | ------------------------------------------------------------ | -------- |
| `turbo-bible` | Turbo Vision–styled terminal Bible reader (Rust, FTS5 search) | [mathiasror/turbo-bible](https://github.com/mathiasror/turbo-bible) · [turbo.bible](https://turbo.bible) |

## Install

```sh
brew install mathiasror/tap/turbo-bible
```

Or, equivalently:

```sh
brew tap mathiasror/tap
brew install turbo-bible
```

## Platforms

`turbo-bible`:

| Platform                | How it installs            |
| ----------------------- | -------------------------- |
| macOS (Apple Silicon)   | Prebuilt binary            |
| macOS (Intel)           | Source build from crates.io (`depends_on "rust" => :build`) |
| Linux (aarch64)         | Prebuilt binary            |
| Linux (x86_64)          | Prebuilt binary            |

GitHub retired the Intel macOS runner in late 2025, so there is no prebuilt
Intel macOS binary — the formula falls back to a source build via Cargo on
that platform. All other platforms install in seconds from the upstream
GitHub Release.

## Notes

This is a personal tap. Once a formula here clears
[homebrew-core's notability bar](https://docs.brew.sh/Acceptable-Formulae)
it will be submitted upstream and dropped from this tap.
