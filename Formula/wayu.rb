class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "3.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dvrd/wayu/releases/download/v3.1.0/wayu-macos-arm64.tar.gz"
      sha256 "PLACEHOLDER_ARM64"
    end
    on_intel do
      url "https://github.com/dvrd/wayu/releases/download/v3.1.0/wayu-macos-amd64.tar.gz"
      sha256 "PLACEHOLDER_AMD64"
    end
  end

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
