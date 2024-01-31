import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var showingSortOptions = false

    var body: some View {
        NavigationView {
            List(networkManager.posts) {post in
                NavigationLink(destination: DetailView(url: post.url)) {            
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4XOR News")
            .toolbar {
                // toolbar: adds button to NavBar
                                Button(action: {
                                    self.showingSortOptions = true
                                }) {
                                    Image(systemName: "line.horizontal.3.decrease.circle")
                                }
                            }
                            .actionSheet(isPresented: $showingSortOptions) {
                                ActionSheet(title: Text("Sort Options"), buttons: [
                                    .default(Text("Sort by points")) {
                                        networkManager.unsetSort()
                                        networkManager.fetchData()
                                    },
                                    .default(Text("Sort by date")) {
                                        networkManager.setSort()
                                        networkManager.fetchData()
                                    },
                                    // above: two calls on of the setter methods, each re-fetches data to update view
                                    .cancel()
                                ])
                            }
        }
        .refreshable {
            self.networkManager.fetchData()
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        
        })
    }
}

#Preview {
    ContentView()
}




