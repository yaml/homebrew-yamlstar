class YamlstarAT0124 < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.24"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "71053d5eca38bd4b3affb4ef04d219b2f7247aa5cfbca904a70bff4c0e384c45"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "a5c223edbe8028dab7d7fa9f7e31d60dcaa2b8299d38756a95de94216495e15f"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "6ac9de1c71ab77326a385700e0ad15a29adc1aebdc1733c259a5efa04247b4f7"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-macos-x64.tar.xz"
      sha256 "2abd565de1ac204b5dcc83873863bdb78283b5253d09a2c2838b4a54eefc3100"
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
