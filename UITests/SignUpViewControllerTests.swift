import XCTest
import UIKit
@testable import UI

class SignUpViewControllerTests: XCTestCase {
    func test_loading_is_hidden_on_start() throws {
        let sd = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sd.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.actitityIndicator?.isAnimating, false)
    }
}
