class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.0.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v4.0.0/wayu-macos-arm64.tar.gz"
  sha256 "0923ec203eea361c0db18352ca5065c59ea7f9cc5e8eef27d48cec778c0f10ac"

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
