class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.3.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.3.0/wayu-macos-arm64.tar.gz"
  sha256 "05c10918b8d363adad9fcd7b7dce3c6632dd805c206b4ff3b1feae3a4ef7cdba"

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
    assert_match version.to_s, shell_output("#{bin!}/wayu version")
  end
end
