class LibyamlstarAT019 < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.9"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "21215431fdc3f8ab660d71f3b2db4998b811082061654f43e025c01ff097be23"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "e0d1602c68e02d2634582c656244f7441445645acd4f54b39ce18ffe225add41"
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
