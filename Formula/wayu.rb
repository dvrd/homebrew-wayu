class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "4.2.0"
  license "MIT"

  url "https://github.com/dvrd/wayu/releases/download/v4.2.0/wayu-macos-arm64.tar.gz"
  sha256 "d1ca5b81801ad980d674db3e38371e13e6e5aff15a65e934adf5d49676242d43"

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
