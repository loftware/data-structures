import XCTest
@testable import LoftDataStructures

// These tests serve only the purpose of ensuring that all the packages
// this one republishes are properly exported. In the case that
// `LoftDataStructures` doesn't properly export something.
final class LoftDataStructuresTests: XCTestCase {

    func testExportEither() {
        let _: Either<Int, String> = .left(3)
    }

    func testExportLoftDataStructures() {
        let _ = [1,2,3].joined(with: [4,5,6])
    }

    static let allTests = [
        ("testEitherExport", testExportEither),
        ("testExportLoftDataStructures", testExportLoftDataStructures),
    ]
}
