import Foundation


struct Results: Decodable {
    let hits: [Post]
    var sortedHits: [Post] {
            hits.sorted { $0.id < $1.id }
        }
    //this is the computed property that sorts the hits array depending on id
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?                            
    
}
