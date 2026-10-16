class LibyamlstarAT0125 < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.25"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "e79806f2efbc23cf82fa62d75f2c17ebd920919a8e685557e02ec53203dfd10e"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "6d54dfe792ab9c3b11f0d1fd72dbcad3b1d013e4952322857dccef8531a7fcac"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "a743cc49c0dbed38a35e1ed161bb8672ee212ae338fae62a80e5729910096780"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/libyamlstar-#{version}-macos-x64.tar.xz"
      sha256 "02c95194124e63aa741aeb7df3981feab975c0f339423150ce969df40589bfba"
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
