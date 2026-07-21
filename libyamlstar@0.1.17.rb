class LibyamlstarAT0117 < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.17"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "866d71a29d5567ca0c742d9604edbe1683b12573eb0b04bec4bcf8c48be59f36"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "257a210a5f61d5242466122643230f5d057e81a30c7b70aff938b45185cc2941"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "de08894695ac98fd9ef28129899035543506c50afa554c802df9ac0a20e814b1"
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
