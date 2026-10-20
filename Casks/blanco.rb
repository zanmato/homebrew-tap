cask "blanco" do
  version "0.1.5"
  sha256 "c723632e0079ec71655fb29ae7a7cd727b65a819e330de9a088966009322c66f"

  url "https://github.com/zanmato/blanco/releases/download/v#{version}/blanco-macos-arm64.tar.gz"
  name "Blanco"
  desc "SQL editor"
  homepage "https://github.com/zanmato/blanco"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Blanco.app"

  # The app is not notarized, so strip the quarantine flag added on download
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Blanco.app"]
  end

  zap trash: "~/Library/Application Support/blanco"
end
