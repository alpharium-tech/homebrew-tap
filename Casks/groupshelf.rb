cask "groupshelf" do
  version "1.1.3"
  sha256 "10035a57c78f6edff647674b8a1dddac63c5d97c9f2b16df9942048f07e759a2"

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

  uninstall quit: "dev.groupshelf.GroupShelf"

  zap trash: [
    "~/Library/Application Support/GroupShelf",
    "~/Library/Caches/dev.groupshelf.GroupShelf",
    "~/Library/HTTPStorages/dev.groupshelf.GroupShelf",
    "~/Library/Preferences/dev.groupshelf.GroupShelf.plist",
  ]
end
