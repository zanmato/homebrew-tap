cask "broquest" do
  version "0.1.14"
  sha256 "5a3e0c9dbc91255525dbccdf206a5ae44aeda5c5e766eddaf92e7d42ef732351"

  url "https://github.com/zanmato/broquest/releases/download/v#{version}/broquest-macos-arm64.tar.gz"
  name "Broquest"
  desc "Desktop API client"
  homepage "https://github.com/zanmato/broquest"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Broquest.app"

  # The app is not notarized, so strip the quarantine flag added on download
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Broquest.app"]
  end

  zap trash: "~/Library/Application Support/broquest"
end
