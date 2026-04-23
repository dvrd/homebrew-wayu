class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.14.1"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.14.1/wayu-macos-arm64.tar.gz"
  sha256 "af9a6d06e58607301d9493977f9d7c31ff1cd66c4d71b0d1c6b902676e448075"

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
