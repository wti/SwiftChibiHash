import ChibiHash
import XCTest

class ChibiHashTests: XCTestCase {
  func testStringHashSensitiveToSmallChanges() {
    let AZ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    // urk: tests just captured results for regression/change testing
    let tests: [(str: String, seed: UInt64, exp: UInt64)] = [
      (AZ, 1, 14_648_792_825_716_835_349),
      ("\(AZ)0", 1, 17_666_229_561_850_575_305),  // small input change
      (AZ, 2, 11_495_492_954_027_102_036),  // small seed change
      (AZ, 3, 7_854_108_398_009_910_827),
    ]
    for (str, seed, exp) in tests {
      let hash = ChibiHasher.hash(string: str, seed: seed)
      XCTAssertEqual(exp, hash, "seed[\(seed)] \(str)")
    }
  }
}
