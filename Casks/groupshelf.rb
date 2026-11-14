cask "groupshelf" do
  version "1.6.0"
  sha256 "7502166f377cd78c1ce84a5195ef6b21fafa842e97b6b7941f81cc063ad0ca82"

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
