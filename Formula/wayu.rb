class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.13.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.13.0/wayu-macos-arm64.tar.gz"
  sha256 "9ed432063066ef3c1d096dbae0852f3e331e058cbec7b3a8d43312ca481414be"

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
