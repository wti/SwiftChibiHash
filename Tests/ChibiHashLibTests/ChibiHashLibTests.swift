import ChibiHashLib
import XCTest

class ChibiHashLibTests: XCTestCase {
  public static let quiet = "" == ""  // edit during debugging

  func demo(print: Bool) -> UInt64? {
    let s = "Now is the time for all good men to come to the aid of their ..."
    return s.utf8.withContiguousStorageIfAvailable { buf in
      chibihash(buf.baseAddress, buf.count, UInt64(31))
    }
  }
  func testDemo() {
    let err = UInt64.max
    let code = demo(print: !Self.quiet) ?? err
    XCTAssertTrue(err != code, "error code: \(code)")
  }
}
