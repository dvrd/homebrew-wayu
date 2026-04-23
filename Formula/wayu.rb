class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.14.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.14.0/wayu-macos-arm64.tar.gz"
  sha256 "b38f180029b3e2452aedcb2b2ad9c96ec1a487518a9464c3612b897e48d3ca7b"

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
