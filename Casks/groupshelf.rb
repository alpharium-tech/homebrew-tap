cask "groupshelf" do
  version "1.3.1"
  sha256 "583616091bc28630d052a2e0018b0a248618e52726ea92b5233ef2a899834e3f"

  url "https://dl.group-shelf.com/GroupShelf-#{version}.zip"
  name "GroupShelf"
  desc "Groups windows from any app into browser-style tabs"
  homepage "https://group-shelf.com/"

  livecheck do
    url "https://group-shelf.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "GroupShelf.app"
  binary "#{appdir}/GroupShelf.app/Contents/Helpers/groupshelf"

  uninstall quit: "dev.groupshelf.GroupShelf"

  zap trash: [
    "~/Library/Application Support/GroupShelf",
    "~/Library/Caches/dev.groupshelf.GroupShelf",
    "~/Library/HTTPStorages/dev.groupshelf.GroupShelf",
    "~/Library/Preferences/dev.groupshelf.GroupShelf.plist",
  ]
end
