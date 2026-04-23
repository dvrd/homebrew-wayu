class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.10.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.10.0/wayu-macos-arm64.tar.gz"
  sha256 "8b860c8a1dda29923a3b5c82744735615d26d88dd99ed5acb5b3d55956b936f6"

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
