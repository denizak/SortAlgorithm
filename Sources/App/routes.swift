import Vapor
import lib

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("health") { req in
        "OK"
    }

    let sortController = SortController()
    router.get("sort", use: sortController.index)
}
