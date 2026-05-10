class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.1.1"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v4.1.1/wayu-macos-arm64.tar.gz"
  sha256 "9263cd7fc9235262fbeb0a0eeaf6af98abf121033eeeb44078466e2b7193f76f"

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
