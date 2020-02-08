import Vapor
import Sort

final class SortController {
    
    func index(_ req: Request) throws -> Future<[Result]> {
        let response = try! req.content
            .decode([Int].self)
            .map(to: [Result].self) { [weak self] items in 
                guard let `self` = self else { return [] }
                return self.sortUsingMultipleMethod(items: items)
        }

        return response 
    }

    private func sortUsingMultipleMethod(items: [Int]) -> [Result] {
        let heapResult = self.sortItems(name: "heap sort", items: items, use: heapSorted(items:))
        let quickResult = self.sortItems(name: "quick sort", items: items, use: quickSorted(array:))

        return [heapResult, quickResult]
    }

    private func sortItems(name: String, items: [Int], use action: ([Int]) -> [Int]) -> Result {
        let start = Date()
        let result = action(items)
        let duration = Date().timeIntervalSince(start)
        return Result(name: name, time: duration, items: result)
    }
}

