class Libyamlstar < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.24"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "e400175a0b98faeb68f9b8142ff58f6ca188fc9c02421e771f85ed400047462c"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "72ae49646fdf6e744550aa823ef04a915a8ab66a733005d5a9d497503185eb87"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "f6410c15b0d1def3637ebc19cf46bb6c6e1ec096d6976f0827faefe6e82e760c"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-macos-x64.tar.xz"
      sha256 "c69c9b3e78eec557a700d8adfb5e355ce156e2442781928a2afd918fd4562f2b"
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
