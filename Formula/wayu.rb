class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.9.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.9.0/wayu-macos-arm64.tar.gz"
  sha256 "d725b209d3ff2d4124cbcef554dee0a15dc8a3468332790dce419d0c502e77a7"

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

      Or for faster startup, use turbo mode:
        source ~/.config/wayu/turbo.zsh
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wayu version")
  end
end
