class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.11.1"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.11.1/wayu-macos-arm64.tar.gz"
  sha256 "b47f1513d9f128ee125de8351ceb3c10f7a10b64dd1673b9ff270acddc496f40"

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
