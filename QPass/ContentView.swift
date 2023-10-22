// Project: QPass
//
//  EID: sk49777
//  Course: CS371L


import SwiftUI
import CodeScanner

struct ContentView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    @State private var timestamp: String = ""
    @State private var name: String = ""
    @State private var submit = false
    
    
    @State private var showSuccessScreen = false

    var body: some View {
        NavigationView{
            VStack(spacing: 10) {
                
                if submit == true && showSuccessScreen == true {
                    SuccessScreen()
                        .transition(.scale)
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                submit = false
                            }
                        }
                } else if submit == true {
                    Text(scannedCode!)
                    TextField("Time Stamp", text: $timestamp).multilineTextAlignment(.center)
                    TextField("Name", text: $name).multilineTextAlignment(.center)
                    Button("Submit"){
                        // Do something with API
                        scannedCode = nil
                        timestamp = ""
                        name = ""
                        showSuccessScreen = true
                    }.buttonStyle(GrowingButton())
                } else {
                    // Navigate to InputPage with scannedCode as parameter
                    //                NavigationView {
                    //                    NavigationLink(destination: InputPage(code: $scannedCode)) {
                    //                        Text("Input Page")
                    //                    }
                    //                }

                    // show fullscreencover with InputPage, passing in scannedCode as parameter, and automatically load InputPage

                    Button("Scan Code") {
                        isPresentingScanner = true
                    }.buttonStyle(GrowingButton())

                    Text("Scan a QR code to begin")
                    
                }
            }
        }
        .sheet(isPresented: $isPresentingScanner) {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    scannedCode = result.string
                    isPresentingScanner = false
                    submit = true
                }
            }
        }
    }
}


//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
