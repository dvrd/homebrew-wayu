class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "6.0.0"
  license "MIT"

  # Prebuilt binaries exist for macOS arm64 and Linux x86_64 only.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/dvrd/wayu/releases/download/v6.0.0/wayu-macos-arm64.tar.gz"
    sha256 "1de65337c7e168baddc879fd5c5b3c3cb52ea3b2a131220e54389cd3b3c87417"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/dvrd/wayu/releases/download/v6.0.0/wayu-linux-amd64.tar.gz"
    sha256 "b2a2b3fc7645771a6e3ee1ae13cb1e80301fc015335162625bba2f52d14b6ddb"
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
