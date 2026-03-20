class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.2.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.2.0/wayu-macos-arm64.tar.gz"
  sha256 "a4865902bc9a216ba94e01948e8b39d49dc5b93ae2169c0cde0d7c3b4b1125a9"

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
