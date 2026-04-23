class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.12.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.12.0/wayu-macos-arm64.tar.gz"
  sha256 "bc864d00b39f336822895f49746a09757232dd2cb4d09ee6f3ab5a3a04391306"

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
