class Yamlstar < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.25"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "8ad5b816fc1b0d31dd8503383ae72eba014701c45363de8aa2768024a2d27b80"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "99945dfa838ff4dccf593c2205f09ec95af5ca3d17be3ecb10be1ecb53cb03b5"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "40b819c4ffda83cc9038476b4fd5f0e04d519fdeab4d45b5bdb2395e272c31be"
    elsif Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "v#{version}/yamlstar-#{version}-macos-x64.tar.xz"
      sha256 "cb410bd2df85ff82ce5179d1d6450b2cfbeb431128b325a78a3b4cfa50ae42ca"
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
