class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.3.4"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v4.3.4/wayu-macos-arm64.tar.gz"
  sha256 "3645f1745f9653553981e9b3beb58ed0e97eac1205a33e02ae989e84b2bbc35f"

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
