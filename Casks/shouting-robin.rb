cask "shouting-robin" do
  version "0.2.2"
  sha256 "e106ca781f9aec8821460f6dcb12a5991406fbe495ed26d33b7dadc8ca242ff7"

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
