class LibyamlstarAT0121 < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.21"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "0a8e2393be2eb0e27f2e2e570a4ed0a29d8a8d2b5fe35945e6eb1496b96d4dd0"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "98ea9fb7d334f96466ad34d85082b1d1bb706466ca33ed5a9f9d980a7a451830"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "47c3c1235e6c7142c4391301bb93c031f55685adcb15346251dbd9a2aeb17747"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-x64.tar.xz"
      sha256 "6fbae6e3db23d708aa43657d2c0961d6108692a816f710e039ca4e01eda7ac02"
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
