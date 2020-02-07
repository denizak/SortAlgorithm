import Vapor
import lib

final class SortController {
    
    func index(_ req: Request) throws -> Future<[Int]> {
        let items = (1...1000).shuffled()
        return req.future(heapSorted(items: items))
    }
}

