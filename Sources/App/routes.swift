import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        "It works!"
    }

    router.get("health") { req in
        return req.future(HTTPStatus.ok)
    }

    let sortController = SortController()
    router.get("sort", use: sortController.index)
}
