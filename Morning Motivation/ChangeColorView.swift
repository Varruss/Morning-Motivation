import SwiftUI

struct ChangeColorView: View {
    @AppStorage("isOn") var isOn = true
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
    @AppStorage("textColor") var textColor = "black"
    @AppStorage("BorderColor") var borderColor = "cyan"
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
    }
}
#Preview {
    ChangeColorView()
}
