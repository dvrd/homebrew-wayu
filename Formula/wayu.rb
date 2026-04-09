class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.4.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.4.0/wayu-macos-arm64.tar.gz"
  sha256 "ec6d0c84e17e04585d73433ad7a2a1986c2e38595124213bfa5a2505a603c37c"

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
