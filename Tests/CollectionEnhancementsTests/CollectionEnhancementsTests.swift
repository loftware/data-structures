import XCTest
@testable import CollectionEnhancements

// These tests serve only the purpose of ensuring that all the packages
// this one republishes are properly exported. In the case that
// CollectionEnhancements doesn't properly export something, these tests should
// fail to compile. Compile time testing... I like the sound of that!
final class CollectionEnhancementsTests: XCTestCase {

    func testExportEither() {
        let _: Either<Int, String> = Either(3)
    }

    func testExportCollectionEnhancements() {
        let _ = [1,2,3].joined(with: [4,5,6])
    }

    static let allTests = [
        ("testEitherExport", testExportEither),
        ("testExportCollectionEnhancements", testExportCollectionEnhancements),
    ]
}
