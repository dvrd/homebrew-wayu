class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  url "https://github.com/dvrd/wayu/releases/download/v4.4.3/wayu-macos-arm64.tar.gz"
  version "4.4.3"
  sha256 "668bfb5a9dc49c3781ced68b3b83b6dcf14a750f8bce56b3939bf01d7b973a12"
  license "MIT"

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
