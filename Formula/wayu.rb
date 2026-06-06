class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.3.3"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v4.3.3/wayu-macos-arm64.tar.gz"
  sha256 "4edf6d81aa798cd4a385b1954efce6fc14d6441fe049a052ff7c57e4f2cfffe3"

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
