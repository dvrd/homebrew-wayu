class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "refs/heads/main"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/refs/heads/main/wayu-macos-arm64.tar.gz"
  sha256 "d826922710358bc416f5b9980f6444e49d0bf1b0f2d2becc56ce87fcd5623562"

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
