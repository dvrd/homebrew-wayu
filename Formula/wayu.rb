class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.5.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.5.0/wayu-macos-arm64.tar.gz"
  sha256 "d590fc9b234c623e045b353f032753c54b4edb876c9f47acfec8eb4beeddc588"

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
