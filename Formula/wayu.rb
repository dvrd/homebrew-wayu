class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "7.0.0"
  license "MIT"

  # Prebuilt binaries exist for macOS arm64 and Linux x86_64 only.
  # macOS: built for 15.0 and later.
  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    url "https://github.com/dvrd/wayu/releases/download/v7.0.0/wayu-macos-arm64.tar.gz"
    sha256 "04c82fa30f93d429b0d3a717f9930a6b0b139a4698a150bb519bf04e4fb5a495"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/dvrd/wayu/releases/download/v7.0.0/wayu-linux-amd64.tar.gz"
    sha256 "18c6bd656fe35465542df701beac73504fd093bc048593a84e2bcdbfae73d0b4"
  end

  def install
    bin.install "wayu"
  end

  def caveats
    <<~EOS
      Set wayu up by running:
        wayu init

      It creates ~/.config/wayu (wayu.toml) and the data dir
      ~/.local/share/wayu, and offers to add the line that loads wayu to
      your shell rc file. To add it yourself:
        zsh  (~/.zshrc):
          source "${WAYU_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/wayu}/init.zsh"
        bash (~/.bash_profile or ~/.bashrc):
          source "${WAYU_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/wayu}/init.bash"
        fish: see "Shell setup" in https://github.com/dvrd/wayu#shell-setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wayu version")
  end
end
