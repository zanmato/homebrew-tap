cask "blanco" do
  version "0.1.6"
  sha256 "81734ac55113e3482d480acd42401543c2714bed010b85a2f647eb1681fb7edd"

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
