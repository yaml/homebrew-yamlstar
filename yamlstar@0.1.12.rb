class YamlstarAT0112 < Formula
  desc "YAMLStar command-line YAML loader"
  homepage "https://yamlstar.org"
  version "0.1.12"
  license "MIT"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-linux-x64.tar.xz"
      sha256 "a693dcc4ab25acd77b76f074d85dcc5b4a6f5c8ef0c3082d17431cd2afc4acf1"
    else
      odie "YAMLStar is not available for this Linux architecture"
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yaml/yamlstar/releases/download/" \
        "#{version}/yamlstar-#{version}-macos-arm64.tar.xz"
      sha256 "b9efc6ba9819be629bb9dbce15cf332df9b9250abe36490f6d64ff68499f2ccf"
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
