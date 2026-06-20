class YamlstarAT015 < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.5"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "78ffa050fe7c61bbae4fa10cfd4940e9c4b1dd2f771c2b0d9fda7e49020c144d"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "5d9cc20e17c934d01fd17a20d85af358ee48caff710a8cdff12c09ffb9c82c05"
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
