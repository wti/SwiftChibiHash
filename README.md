# SwiftChibiHash
- Swift wrapper for [Chibi-hash](https://github.com/N-R-K/ChibiHash)
- The algorithm only supports a single session; you cannot hash discontinuous data together.

## Usage
- Declare dependency in Package.swift, `Package(...,`:
    - `dependencies: `
        - `.package(url: "https://github.com/wti/SwiftChibiHash.git", from: "0.0.1")`
    - `targets: [ .target(..., dependencies: `
        - `[.product(name: "ChibiHash", package: "SwiftChibiHash")]`
- Code: see e.g., [ChibiHashTests](Tests/ChibiHashTests/ChibiHashTests.swift)
- The seed value provides some variance to avoid hash attacks
- Warning: combining with Swift's hasher isn't easy and may not be wise 

## Development
- [chibi-hash.h](Sources/ChibiHashLib/include/chibihash.h) is manually copied from its source repository

## Legal
- ChibiHash is in the public domain (as of this writing)
- This wrapper project is released under an MIT license.
