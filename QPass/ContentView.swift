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
    
    
    @State private var relevantNotificationTime = Date.now
    @State private var showSuccessScreen = false
    private let lightGreen = Color(red: 0, green: 1.0, blue: 0, opacity: 0.5)
    var body: some View {
        
        Rectangle().background(lightGreen).foregroundColor(.green)
        
        Image("QPass").resizable().aspectRatio(contentMode: .fill).border(.blue.gradient, width: 3).cornerRadius(10).offset(y:-70).padding([], 0).background()
        VStack {
            // tried using NavigationLink, switched to using delegate like interface
            if submit == true && showSuccessScreen == true {
                SuccessScreen()
                    .transition(.scale)
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            submit = false
                        }
                    }
            } else if submit == true {
                Text("QR Data: \(scannedCode!)").offset(y:-50)
                Text("Notification Time")
                DatePicker("", selection: $relevantNotificationTime, in: Date.now...).datePickerStyle(.compact).position(x:120, y: 50).frame(width: 400, height: 100).offset(y: -25)
                
                TextField("Pass Name", text: $name).multilineTextAlignment(.center).offset(y: -25)
                Button("Submit"){
                    // Do something with API
                    scannedCode = nil
                    timestamp = ""
                    name = ""
                    showSuccessScreen = true
                }.buttonStyle(GrowingButton())
            } else {
                Button("Scan Code") {
                    isPresentingScanner = true
                }.buttonStyle(GrowingButton())
                
                Text("Scan a QR code to begin")
                
            }
            Spacer(minLength: 120)
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
