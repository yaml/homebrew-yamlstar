class LibyamlstarAT0123 < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.23"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "73b3b09891d8e7312fa9da181124e0686f8735fe8f947bf17b2805054d8846bf"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "4650870b6ffcaff535cf39757cab53368c7592bf02905291d09cffdeec5d2890"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "b9ebcb4723f897f28459cfe69afea2f833adee1184af239b2a1909c33c9e3b7b"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-macos-x64.tar.xz"
      sha256 "c372643b3717714150f80314aa651b07322f98b077ce85cbbc1233e36aecb004"
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
