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
    
    var body: some View {
        NavigationView{
            VStack(spacing: 10) {
                if submit == true {
                    Text(scannedCode!)
                    TextField("Time Stamp", text: $timestamp)
                    TextField("Name", text: $name)
                    Button("Submit"){
                        // Do something with API
                        scannedCode = nil
                        timestamp = ""
                        name = ""
                        submit = false
                    }
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
                    }
                    
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
