class YamlstarAT0121 < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.21"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "0a23af93a04a62d0bff01b47689213718c274da712448a18f7bc58f882ca51db"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "d6934634b08847b3113608a100f1ab389f2eac7252586f7fe0afbf31a91a70a4"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "d94c71f73b677ebd5317f61f9360303c37a7c93c250da6f8c148c0f20dc106b8"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-macos-x64.tar.xz"
      sha256 "a4bc3c97084877ba77b590e08e13b95aae2943f44ebcd562486ae711cfd0ea28"
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
