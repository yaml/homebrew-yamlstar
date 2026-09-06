class LibyamlstarAT0120 < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.20"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "44bddcfa1a88614e66fc79135d3a1055aa0616109380aca7a82843c073dff79b"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "fe693435de0cb6988bab47ac7cc36271a2d0fd81ffc6eaae81d77e3f3bb5bc86"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "f6111638e7250be64f4bf067eb040f957ca66a3b84eb59853151d76d41f36a73"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-x64.tar.xz"
      sha256 "c1e972de3b61a80ddcac90ec2dbdfd382a2f105f960c489b4fe80fafe711f4a1"
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
