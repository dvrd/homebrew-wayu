class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.4.4"
  license "MIT"

  # Prebuilt binaries exist for macOS arm64 and Linux x86_64 only.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/dvrd/wayu/releases/download/v4.4.4/wayu-macos-arm64.tar.gz"
    sha256 "5d8b93678cbb0f27b49c0ef82d2a911d527720e086e4b2129a4d233fa0e03fec"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/dvrd/wayu/releases/download/v4.4.4/wayu-linux-amd64.tar.gz"
    sha256 "0c8b6d29aadcc2aa98d5ccbdf60f47b9592d47f713e9f4abf5d884683ed37ddc"
  end

  def install
    bin.install "wayu"
  end

  def caveats
    <<~EOS
      Initialize wayu config files by running:
        wayu init

      Then add this line to your shell RC file:
        source ~/.config/wayu/init.zsh   # zsh
        source ~/.config/wayu/init.bash  # bash
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wayu version")
  end
end
