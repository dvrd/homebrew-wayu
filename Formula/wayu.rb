class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.15.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.15.0/wayu-macos-arm64.tar.gz"
  sha256 "d3fc5314356581ec3a50a9ee631b021ed5b6a2ba88d41c40f0b8f09bcc0dd13d"

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
