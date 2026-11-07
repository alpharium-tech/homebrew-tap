cask "groupshelf" do
  version "1.5.0"
  sha256 "9cb25369d6a421755e4c9ddced5da744dda672851bea6adba73f4ec9e1816bfb"

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
