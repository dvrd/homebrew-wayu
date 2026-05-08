class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.0.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v4.0.0/wayu-macos-arm64.tar.gz"
  sha256 "7dcbcd488ddc7ae56b660656800e4bc4935f67837787cfd5241f9fd9b0bef616"

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
