# Mobiquity

Description: Simple app that retrieves json list of images from a Flickr api and shows them in a 2 column scrollable view. Also stores the search history in a database and allows user to view the search history

    - Architecture: MVVM
    - UI: SwiftUI
    - Internal Modules: NetworkProvider
    - 3rd Party Frameworks: Kingfisher(Images), SQLite(Database)
    - Library Dependency Manager: Swift Package Manager

-----------------------------------------------------------------

Build Issue noticed on Xcode 13.2.1

It's been brought to my attention that the local package NetworkProvider can sometimes initially have a build issue and show the error "Missing Package Product".
This seems to be an issue experienced elsewhere with Xcode 13.2.1 and SwiftPackageManager and with no clear resolution yet
 https://stackoverflow.com/questions/69281786/local-swift-packages-stopped-working-in-xcode-13

To resolve this either

A)
1. Quit Xcode
2. Open Terminal
3. Navigate to the directory where your .xcodeproj is via Terminal (cd path/to/your/apps/folder)
4. Run xcodebuild -resolvePackageDependencies
5. After the packages finish resolving, open Xcode and try building again.

B)
1. Remove local package references from the workspace  
2. Re-add the reference to the package
 
