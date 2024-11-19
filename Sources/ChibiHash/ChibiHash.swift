import ChibiHashLib

/// Swift interface to chibi-hash
///
/// For details, see [chibi-hash on github](https://github.com/N-R-K/ChibiHash)
/// 
/// Limitations
/// - Algorithm supports only a single session; 
///   cannot hash discontinuous data together
/// - Indirection interferes with inlining
public enum ChibiHasher {
  public static let SEED = UInt64(42)

  /// Hash String utf8 view bytes
  /// - Parameters:
  ///   - string: String
  ///   - seed: UInt64 mixture value (defaults to ``SEED``)
  /// - Returns: UInt64 chibi hash
  public static func hash(string: String, seed: UInt64 = Self.SEED) -> UInt64? {
    return string.utf8.withContiguousStorageIfAvailable { buf in
      chibihash(buf.baseAddress, buf.count, seed)
    }
  }

  /// Hash Array of UInt8
  /// - Parameters:
  ///   - bytes: Array of UInt8
  ///   - seed: UInt64 mixture value (defaults to ``SEED``)
  /// - Returns: UInt64 chibi hash
  public static func hash(bytes: [UInt8], seed: UInt64 = Self.SEED) -> UInt64? {
    return bytes.withContiguousStorageIfAvailable { buf in
      chibihash(buf.baseAddress, buf.count, seed)
    }
  }

  /// Hash pointer to (unsafe) UInt8 buffer, with (unsafe) count
  /// - Parameters:
  ///   - unsafePtr: UnsafePointer to UInt8
  ///   - count: Count of UInt8
  ///   - seed: UInt64 mixture value (defaults to ``SEED``)
  /// - Returns: UInt64 chibi hash
  public static func hash(
    unsafePtr: UnsafePointer<UInt8>,
    count: Int,
    seed: UInt64 = Self.SEED
  ) -> UInt64 {
    chibihash(unsafePtr, count, seed)
  }

  public static func demo(print: Bool) -> UInt64? {
    hash(string: "Now is the time for all good men to come to the aid ...")
  }
}
