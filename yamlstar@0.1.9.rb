class YamlstarAT019 < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.9"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "4b46437286f01ae9ed134a92621c4ddb9c62e7dbac096bd1eb48d064dac5b6f4"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "5b98bfdd9898f957b149702c6036b358427cf3431d1d7c3c63fa93ab1c0812cf"
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
