class LibyamlstarAT0119 < Formula
  desc "YAMLStar shared library"
  homepage "https://yamlstar.org"
  version "0.1.19"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-x64.tar.xz"
      sha256 "6f4b126ab0ed7f5801a0c3eb7ae9f60799db5ef7b609797165df4700601e8602"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "c927b29ee0e33050d7bd4516092809578975efa222e14e55bb11d4d3874ffbf4"
    else
      odie "libyamlstar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "854dab5c06ca5c415a35d8413cbfbb738409e90ce0f865be64fea10ecf6f8e92"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/libyamlstar-#{version}-macos-x64.tar.xz"
      sha256 "ff62406b12f006d21d57b10c911f2a805a402b670be97a1275611518b6a6498f"
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
