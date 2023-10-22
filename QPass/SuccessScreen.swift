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
            Text("Success!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .onAppear {
                    counter += 1
                }.confettiCannon(counter: $counter)
            VStack{
                Spacer().frame(height: 250)
                HStack{
                    Spacer()
                    AddPassButton().frame(width: 150, height: 55)
                    Spacer()
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

