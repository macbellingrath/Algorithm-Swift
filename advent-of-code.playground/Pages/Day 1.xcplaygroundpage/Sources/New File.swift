import Foundation
let fileName = "input"

public func testInput() throws -> [Int]  {
    let path = URL(fileReferenceLiteralResourceName: fileName)
    return try String(contentsOf: path).components(separatedBy: .newlines).map({ Int($0)! })
}
