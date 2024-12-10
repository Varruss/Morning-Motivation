import SwiftUI

struct ChangeColorView: View {
    @AppStorage("isOn") var isOn = true
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
    @State private var showAlert = false
    @State private var previousBackgroundColor = "white"
    @State private var newBackgroundColor: String? = nil
    @AppStorage("textColor") var textColor = "black"
    @AppStorage("BorderColor") var borderColor = "cyan"
    @AppStorage("BackgroundColor") var backgroundColor = "white"
    private let colorDictionary: [String: Color] = [
           "black": .black,
           "white": .white,
           "gray": .gray,
           "red": .red,
           "orange": .orange,
           "yellow": .yellow,
           "green": .green,
           "blue": .blue,
           "indigo": .indigo,
           "purple": .purple,
           "pink": .pink,
           "cyan": .cyan,
           "teal": .teal
       ]
    var body: some View {
        Color(colorDictionary[backgroundColor] ?? .white)
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    if OutlineOn {
                        RoundedRectangle(cornerRadius: 65)
                            .stroke(colorDictionary[borderColor] ?? .cyan, lineWidth: 15)
                            .ignoresSafeArea()
                            .background(
                                RoundedRectangle(cornerRadius: 65)
                                    .fill(Color.clear)
                                    .ignoresSafeArea()
                            )
                            .shadow(color: colorDictionary[borderColor] ?? .cyan, radius: 15, x: 0, y: 0)
                            .ignoresSafeArea()
                    }
                    VStack{
                        Text("Customize UI")
                            .foregroundColor(colorDictionary[textColor] ?? .black)
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Menu {
                            ForEach(colorDictionary.keys.sorted(), id: \.self) { colorKey in
                                Button(colorKey.capitalized) {
                                    textColor = colorKey
                                }
                            }
                        } label: {
                            Label("Text Color", systemImage: "arrow.down.circle")
                                .foregroundColor(colorDictionary[textColor] ?? .black)
                                .font(.system(size: 35))
                                .padding()
                        }
                        Menu {
                            ForEach(colorDictionary.keys.sorted(), id: \.self) { colorKey in
                                Button(colorKey.capitalized) {
                                    newBackgroundColor = colorKey
                                    if colorKey == textColor || colorKey == borderColor {
                                        showAlert = true
                                    } else {
                                        backgroundColor = colorKey
                                    }
                                }
                            }
                        } label: {
                            Label("Background Color", systemImage: "arrow.down.circle")
                                .foregroundColor(colorDictionary[textColor] ?? .black)
                                .font(.system(size: 35))
                                .padding()
                        }
                        Menu {
                            ForEach(colorDictionary.keys.sorted(), id: \.self) { colorKey in
                                Button(colorKey.capitalized) {
                                    borderColor = colorKey
                                }
                            }
                        } label: {
                            Label("Border Color", systemImage: "arrow.down.circle")
                                .foregroundColor(colorDictionary[textColor] ?? .black)
                                .font(.system(size: 35))
                                .padding()
                        }
                    }
                }
            )
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Warning"),
                    message: Text("The background color is the same as the text or border color. Do you want to continue or revert to the previous color?"),
                    primaryButton: .destructive(Text("Continue")) {
                        if let newBackgroundColor = newBackgroundColor {
                            previousBackgroundColor = backgroundColor
                            backgroundColor = newBackgroundColor
                        }
                    },
                    secondaryButton: .cancel(Text("Revert")) {
                        backgroundColor = previousBackgroundColor
                    }
                )
            }
            .onChange(of: backgroundColor) { newValue in
                previousBackgroundColor = newValue
        }
    }
}
#Preview {
    ChangeColorView()
}
