    import XCTest
    import SwiftUI
    @testable import SwiftUIKitNavigation

    final class SwiftUIKitNavigationTests: XCTestCase {
        
        
        func testExample() {
            
            var body: some View {
                SwiftUIKitNavigation.UIKitNavigation {
                    ContentView()
                }
            }
            
        }
        
        static var allTests = [
            ("testExample", testExample)
        ]
    }
    
    
    
    struct ContentView: View {
        var body: some View {
            Text("Hello world")
        }
    }
