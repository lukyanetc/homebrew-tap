cask "what-was-that" do
  version "0.0.3"
  sha256 "ХЕШ"

  url "https://github.com/lukyanetc/what-was-that/releases/download/v#{version}/What.Was.That-#{version}.zip"
  name "What Was That!?"
  desc "Day-by-day timeline on the macOS desktop"
  homepage "https://github.com/lukyanetc/what-was-that"

  depends_on macos: ">= :sequoia"

  app "What Was That.app"

  # Приложение не подписано Apple: без этого Gatekeeper покажет «повреждено».
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/What Was That.app"]
  end
end
