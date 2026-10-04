class YamlstarAT0123 < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.23"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "8f2fba8bf46800d76b5646153f636dcb85c59919fe6cacda8e7508c5d4f5f995"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "4dbfa755bee0b71a3168cc4e09bdada226ceb182a878bfc2cde0e62afc8ce14c"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "040e277edd6aefe77f6d91e167ee3cb7ea062b7109d95eb1e79dc484e58d319d"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-macos-x64.tar.xz"
      sha256 "783d0e37d4f3aa271e7b563e051bb43e95dfb35813665bb4d927bdd90aa23c9a"
    else
      odie "YAMLStar is not available for this macOS architecture"
    end
  end

  def install
    bin.install "yaml"
  end

  test do
    assert_match "yaml v#{version}",
      pipe_output("#{bin}/yaml --version")
  end
end
