class YamlstarAT0117 < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.17"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "fe7780f9f8024510eb618f3cdf6daa6a4932a9c6c7e724906ded4af0912c2519"
    elsif Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-linux-aarch64.tar.xz"
      sha256 "3ef27967a7754dde4d5686cedd0fcd001464102779c5ec5774be34db30b317f6"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "701b632b2b0c65db4bdb95124a457492878a1f8439a072e827b37e7af55c56e9"
    else
      odie "YAMLStar is not available for this macOS architecture"
    end
  end

  def install
    bin.install "yaml"
  end

  test do
    assert_match "yamlstar version #{version}",
      pipe_output("#{bin}/yaml --version")
  end
end
