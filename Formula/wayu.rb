class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.10.1"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.10.1/wayu-macos-arm64.tar.gz"
  sha256 "b180bff4aa8444ae86dcd0a0edc6cf4bd17e16bb6320851749423332064a7715"

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
