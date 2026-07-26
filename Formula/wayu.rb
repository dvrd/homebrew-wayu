class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  url "https://github.com/dvrd/wayu/releases/download/v4.4.1/wayu-macos-arm64.tar.gz"
  version "4.4.1"
  sha256 "8962bb629ef4119715ea94637ea7109f78c64ab77c7379896093ed6c17840975"
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
