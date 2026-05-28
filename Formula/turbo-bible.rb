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
      url "https://github.com/mathiasror/turbo-bible/releases/download/v0.1.0/turbo-bible-aarch64-apple-darwin.tar.gz"
      sha256 "a35f242431ab9717f8568c211c9b0c1d8c90bce7e82401c8d6fe05fd98c0ecfa"
    end
    on_intel do
      # No prebuilt binary for Intel macOS — source-build from the crates.io
      # tarball, which (unlike the GitHub tag tarball) ships the bundled KJV
      # asset via Cargo.toml's `include = [...]` whitelist.
      url "https://static.crates.io/crates/turbo-bible/turbo-bible-0.1.0.crate"
      sha256 "c56716098ee83c70bc66d0323fab112570c1569f4e9b1a2b988a079d8088847e"

      depends_on "rust" => :build
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mathiasror/turbo-bible/releases/download/v0.1.0/turbo-bible-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a75e11f8a6e61a4eb78c135c777b74443dac2213a1b683d09d27ecf0f9080dd"
    end
    on_intel do
      url "https://github.com/mathiasror/turbo-bible/releases/download/v0.1.0/turbo-bible-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "baf67400c47a8be51619e5cddc575132b64420e77a321b14dde197c04c64e1b5"
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
