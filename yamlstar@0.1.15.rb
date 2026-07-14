class YamlstarAT0115 < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.15"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "e3cd235632af5cb5db46e9395afc663b0e93163675829a96cc607211901cd7c1"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "37740277c33e28682d6e4f8cb8b2e0c057862c111f1e8529c16cb75aaf7392a0"
    else
      odie "YAMLStar is not available for this macOS architecture"
    end
  end

  def install
    bin.install "yaml"
  end

  test do
    assert_match "yamlstar version #{version}",
      pipe_output("#{bin}/yaml --version")
  end
end
