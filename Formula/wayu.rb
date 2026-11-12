class Wayu < Formula
  desc "Shell configuration management CLI — PATH, aliases, env vars, plugins"
  homepage "https://github.com/dvrd/wayu"
  version "8.0.0"
  license "MIT"

  # Prebuilt binaries: macOS arm64 + x86_64 (15.0 and later),
  # Linux x86_64 + arm64.
  on_macos do
    depends_on macos: :sequoia

    on_arm do
      url "https://github.com/dvrd/wayu/releases/download/v8.0.0/wayu-macos-arm64.tar.gz"
      sha256 "5140f223f4f37d573971a0fda8b8a3ba8e3aa5e5d17dcfba8f4c13f6ecdb068f"
    end
    on_intel do
      url "https://github.com/dvrd/wayu/releases/download/v8.0.0/wayu-macos-amd64.tar.gz"
      sha256 "80238f281d0a101a0d0b36c182118b491baf782bf25800b8c87784f93f0c4383"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvrd/wayu/releases/download/v8.0.0/wayu-linux-arm64.tar.gz"
      sha256 "ccef5252c936a1ec51713eacb9239215b5cd46b8e54d3cf1235343d40d6ed58a"
    end
    on_intel do
      url "https://github.com/dvrd/wayu/releases/download/v8.0.0/wayu-linux-amd64.tar.gz"
      sha256 "51291a9dc56eff560486f36721359c43665a2c97a849a7ceeb7e1520e34e45b5"
    end
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
