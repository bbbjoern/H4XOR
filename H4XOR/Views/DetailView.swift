import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        if let safeUrl = url {
            WebView(url: URL(string: safeUrl)!)
                .edgesIgnoringSafeArea(.all)
        } else {
            Image("globe")
            Text("No URL to display.")
        }
    }
}

#Preview {
    DetailView(url: "www.google.com")               
}


