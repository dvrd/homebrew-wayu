class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.11.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.11.0/wayu-macos-arm64.tar.gz"
  sha256 "011c8917e3d1c4556df5cf0c054a516bb8a14d0ebe6e97acc0e61fc406040ff5"

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
