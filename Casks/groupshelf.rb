cask "groupshelf" do
  version "1.7.0"
  sha256 "571737bfca5f649183dae0a5bc5e43c2d1777337265da448c890bfb1a5f2f276"

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
