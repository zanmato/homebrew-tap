cask "shouting-robin" do
  version "0.2.3"
  sha256 "b764c54c5bf9fe965cc02a6276d9d689ebd87bdb8d5c792644b4308fd2e68590"

  url "https://github.com/zanmato/shouting-robin/releases/download/v#{version}/shoutingrobin-macos-arm64.tar.gz"
  name "Shouting Robin"
  desc "Desktop SEO crawler"
  homepage "https://github.com/zanmato/shouting-robin"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Shouting Robin.app"

  # The app is not notarized, so strip the quarantine flag added on download
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Shouting Robin.app"]
  end

  zap trash: "~/Library/Application Support/shoutingrobin"
end
