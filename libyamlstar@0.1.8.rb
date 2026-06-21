class LibyamlstarAT018 < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.8"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "ee5223c610185f3c686fec06db66b1d5f9ac36055b07ec0f23bb0fb85cc14640"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "baca4ab27271384524fc6effb973aaa7da6246bd2adfa61d952948fa5163eb61"
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
