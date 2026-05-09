class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.0.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v4.0.0/wayu-macos-arm64.tar.gz"
  sha256 "810d26d3b190575c2e5edae879deb7e548b820ff88e926e7b40d502c1157e4a8"

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
