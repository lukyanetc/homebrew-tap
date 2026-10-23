cask "what-was-that" do
  version "0.0.3"
  sha256 "2cb9a1262efeef6ad845571a03f9e040fe678a70e491c00b85f0116e7d305155"

  url "https://github.com/lukyanetc/what-was-that/releases/download/v#{version}/What.Was.That-#{version}.zip"
  name "What Was That!?"
  desc "Quiet day-by-day timeline on your desktop"
  homepage "https://github.com/lukyanetc/what-was-that"

  depends_on macos: :sequoia

  app "What Was That.app"

  # Приложение не подписано Apple: без этого Gatekeeper покажет «повреждено».
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/What Was That.app"]
  end
end
