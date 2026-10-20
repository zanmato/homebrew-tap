cask "blanco" do
  version "0.1.4"
  sha256 "34fe84cbfc4e1012f40b1c1029797f6f9ed16594f8555089674e39f5c4363da5"

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
