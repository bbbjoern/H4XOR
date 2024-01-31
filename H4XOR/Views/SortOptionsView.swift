import SwiftUI

struct SortOptionsView: View {
    // This closure is called with the sorting option selected by the user.
    var sortSelection: (String) -> Void

    var body: some View {
        VStack(spacing: 10) {
            Button("Sort by point") {
                sortSelection("point")
            }
            Button("Sort by date") {
                sortSelection("date")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}


