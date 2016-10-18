import XCTest
@testable import Async

class AsyncTests: XCTestCase
{
    func testSimple()
	{
		let x = await(async {
			return 42
		})
		XCTAssertEqual(x, 42)
    }

	func testSimpleDispatch()
	{
		let x = await(async { (t: Task<Int>) in
			var y = 1
			DispatchQueue.global(qos: .default).async {
				y = 42
				Async.Wake(t)
			}
			Async.Suspend()
			return y
		})
		XCTAssertEqual(x, 42)
	}

	func testDoubleDispatch()
	{
		let x = await(async { (t: Task<Int>) in
			var y = 1
			DispatchQueue.global(qos: .default).async {
				y = 2
				DispatchQueue.global(qos: .default).async {
					y = 42
					Async.Wake(t)
				}
			}
			Async.Suspend()
			return y
		})
		XCTAssertEqual(x, 42)
	}

	func testDoubleAwait()
	{
		let x = await(async { (t: Task<Int>) in
			var y = 1
			DispatchQueue.global(qos: .default).async {
				y = await (async { (t1: Task<Int>) in
					var z = 2
					DispatchQueue.global(qos: .default).async {
						z = 42
						Async.Wake(t1)
					}
					Async.Suspend()
					return z
				})
				Async.Wake(t)
			}
			Async.Suspend()
			return y
		})
		XCTAssertEqual(x, 42)
	}

    static var allTests : [(String, (AsyncTests) -> () throws -> Void)]
	{
        return [
            ("testSimple", testSimple),
            ("testSimpleDispatch", testSimpleDispatch),
            ("testDoubleDispatch", testDoubleDispatch),
        ]
    }
}
