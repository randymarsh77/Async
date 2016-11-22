# Async

Alastair Houghton's Swift implementation of C#'s async/await. Updated to Swift 3, slightly modified, and provided as a package.

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
[![GitHub release](https://img.shields.io/github/release/randymarsh77/async.svg)]()
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Build Status](https://api.travis-ci.org/randymarsh77/async.svg?branch=master)](https://travis-ci.org/randymarsh77/async)
[![codebeat badge](https://codebeat.co/badges/f4abb472-cc01-4c45-93c3-48dd07fe52d2)](https://codebeat.co/projects/github-com-randymarsh77-async)

## Note

Original version and documentation can be found on [Bitbucket](https://bitbucket.org/al45tair/async).

I am in no way affiliated with Alastair, just taking advantage of the gracious MIT license on this ingenious implementation.

## Usage

`swift build` works out of the box. For any downstream Xcode project, `swift package generate-xcodeproj` works well. However, as of 3.0, you'll need to manually link `CoreFoundation` to the `CAsync` target.
