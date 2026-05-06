class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.16.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.16.0/wayu-macos-arm64.tar.gz"
  sha256 "0f200716db5f6f0e57a1f0517e8b3f32ac165013219445163f4c0e7e47448949"

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
