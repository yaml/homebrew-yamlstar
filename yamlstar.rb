class Yamlstar < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.26"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "cf4d34c9e406b2a9f003e3be0d4b30f16659ac40c4fff91fab5239d28cca56db"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "784b75e2ad843e7c8ec2784e506005e5e837005d324fe0e1267aa43a49839b09"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "4aaf15f0fd5537c97e5fd5c0abc7e1ee428d1a53bb7ccfbe12e4c99ea00e38cf"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-macos-x64.tar.xz"
      sha256 "8cb2aa3d26b820f510de596879b32ccc1d28e3e2b66721fbd4677bb715658e3a"
    else
      odie "YAMLStar is not available for this macOS architecture"
    end
  end

  def install
    bin.install "yaml"
  end

  test do
    assert_match "yaml v#{version}",
      pipe_output("#{bin}/yaml --version")
  end
end
