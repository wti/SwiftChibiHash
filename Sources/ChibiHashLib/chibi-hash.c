// c file for Swift Package Manager to build header-only implementation
// see https://github.com/apple/swift-package-manager/issues/5706

#include "chibihash.h"

uint64_t
chibihash(const void *keyIn, ptrdiff_t len, uint64_t seed) {
    return chibihash64(keyIn, len, seed);
}
