// Project: QPass
//  
//  EID: sk49777
//  Course: CS371L


import SwiftUI
import ConfettiSwiftUI

struct SuccessScreen: View {
    @State private var counter: Int = 1

    var body: some View {
        ZStack {
            Color.green
            Text("Success!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .onAppear {
                counter += 1
            }
            .confettiCannon(counter: $counter)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

