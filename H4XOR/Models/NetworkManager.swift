import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    var sortedByDate = true
    // Boolean to determine it the results should be sorted by date (= by id)
    
    func setSort() {
        sortedByDate = true
    }
    
    func unsetSort() {
        sortedByDate = false
    }
    // two setter methods - they are called from the ContentView depending on the sort selection
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                // below: calling the sorted or unsorted results, depending on boolean
                                if self.sortedByDate {
                                    self.posts = results.sortedHits
                                } else {
                                    self.posts = results.hits
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
