class Libyamlstar < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.26"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "1ef30005b09bf90fa8b8db79e4a6b1d3fa6d809d7603a4485e83ef0516343998"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "6b695ddadc9a3be797b67aa2b633d84b6fc8e6b51cd305067a147851ace73996"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "170be478e998a63acafef697ff25de81b9f4e68fb14f649de90e1a0dca5d75a4"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-macos-x64.tar.xz"
      sha256 "e4fe376282dac993a4d878f2d7f7dc4af3464cf4c6a528d0e99ce2652c19332f"
    else
      odie "libyamlstar is not available for this macOS architecture"
    end
  end

  def install
    lib.install Dir["libyamlstar*.so*"]
    lib.install Dir["libyamlstar*.dylib*"]
    (include/"libyamlstar-#{version}").install Dir["*.h"]
  end

  test do
    if OS.mac?
      assert_predicate lib/"libyamlstar.dylib", :exist?
    else
      assert_predicate lib/"libyamlstar.so", :exist?
    end
  end
end
