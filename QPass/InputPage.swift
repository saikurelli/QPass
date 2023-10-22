// Project: QPass
//
//  EID: sk49777
//  Course: CS371L


import SwiftUI

struct InputPage: View {
    // takes in parameter code from ContentView
    @Binding var code: String?

    var body: some View {
        VStack {
            Text("Input Page")
            Text(code!)
        }
    }
}

//struct InputPage_Previews: PreviewProvider {
//    static var previews: some View {
//        InputPage(code: "c76gr5mvJtUBQMa")
//    }
//}
