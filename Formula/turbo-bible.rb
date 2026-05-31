class TurboBible < Formula
  desc "Turbo Vision-styled terminal Bible reader with FTS5 search"
  homepage "https://turbo.bible"
  license any_of: ["Apache-2.0", "MIT"]

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/mathiasror/turbo-bible/releases/download/v0.2.0/turbo-bible-aarch64-apple-darwin.tar.gz"
      sha256 "3bec244ca07ce94f4f7b4cc3297f1e8a80a3376aeca973ccd8c745be6669b5e5"
    end
    on_intel do
      # No prebuilt binary for Intel macOS — source-build from the crates.io
      # tarball, which (unlike the GitHub tag tarball) ships the bundled KJV
      # asset via Cargo.toml's `include = [...]` whitelist.
      url "https://static.crates.io/crates/turbo-bible/turbo-bible-0.2.0.crate"
      sha256 "d0abd25a65b631aac607b84fad71981f15394529f7fda256b94d9d63a3b14dc4"

      depends_on "rust" => :build
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mathiasror/turbo-bible/releases/download/v0.2.0/turbo-bible-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5d746299752492c08e6346f68de94641a85854dddedc40039265f39d4d6a0a3"
    end
    on_intel do
      url "https://github.com/mathiasror/turbo-bible/releases/download/v0.2.0/turbo-bible-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1caf352b66d27b498a14bcc00ee254bc5d8d2ad9d701a3d359459c9b74cac663"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      system "cargo", "install", *std_cargo_args(path: ".")
    else
      bin.install "turbo-bible"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/turbo-bible --version")
  end
end
