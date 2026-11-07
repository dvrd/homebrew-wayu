class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.4.5"
  license "MIT"

  # Prebuilt binaries exist for macOS arm64 and Linux x86_64 only.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/dvrd/wayu/releases/download/v4.4.5/wayu-macos-arm64.tar.gz"
    sha256 "1794cbbd0f6159bd634d3fae974d606c756122f7b53914ce5e88d3813e69e697"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/dvrd/wayu/releases/download/v4.4.5/wayu-linux-amd64.tar.gz"
    sha256 "c1c31a06a9451d212f70b4c0bc5e33e60407f52d5960f2798e8696d658cbc35d"
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
