class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "5.0.0"
  license "MIT"

  # Prebuilt binaries exist for macOS arm64 and Linux x86_64 only.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/dvrd/wayu/releases/download/v5.0.0/wayu-macos-arm64.tar.gz"
    sha256 "dfaf04594855a04ece5097a01a203ad00ea500c7a30ae90da369879a8bec7af2"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/dvrd/wayu/releases/download/v5.0.0/wayu-linux-amd64.tar.gz"
    sha256 "7390d04e554a0cb8a08e6d2283f2174aafed3ca93a1d941a614ad50ae5c9b5b5"
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
