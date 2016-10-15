# Async
Alastair Houghton's Swift implementation of C#'s async/await. Updated to Swift 3, slightly modified, and provided as a package.

Original version and documentation can be found on [Bitbucket](https://bitbucket.org/al45tair/async).

Note: I am in no way affiliated with Alastair, just taking advantage of the gracious MIT license on this ingenious implementation.

## Usage

`swift build` works out of the box. For any downstream Xcode project, `swift package generate-xcodeproj` works well. However, as of 3.0, you'll need to manually link `CoreFoundation` to the `CAsync` target.
