// Project: QPass
//  
//  EID: sk49777
//  Course: CS371L


import SwiftUI
import ConfettiSwiftUI
import PassKit

struct AddPassButton: UIViewRepresentable {
    func updateUIView(_ uiView: PKAddPassButton, context: Context) {
        // prot stub
    }
    
    func makeUIView(context: Context) -> PKAddPassButton {
        return PKAddPassButton(addPassButtonStyle: .black)
    }
    
    typealias UIViewType = PKAddPassButton
}



struct SuccessScreen: View {
    @State private var counter: Int = 1
    
    var body: some View {
        ZStack {
            Color.green
            VStack {
                Spacer(minLength: 50)
                Text("Success!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .onAppear {
                        counter += 1
                    }.confettiCannon(counter: $counter)
                Spacer(minLength: 50)
                
                HStack{
                    Spacer()
                    AddPassButton().frame(width: 150, height: 55)
                    Spacer()
                }
                Spacer().frame(height: 250)
            }
        }
    }
}

