class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.6.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v3.6.0/wayu-macos-arm64.tar.gz"
  sha256 "83dedb60559b7631bb01998f038eaf6cf02f56551472b214c91c84e1d9f71f05"

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
