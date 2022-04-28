import SwiftUI

struct EditList: View {

    // MARK: - Elements

    @State private var mediaList = AppleMusicModel().getMediaList()
    
    // MARK: - Body

    var body: some View {
        List {
            ForEach(0..<mediaList.count) { idx in
                Toggle(isOn: self.$mediaList[idx].isOn) {
                    Image(systemName: self.mediaList[idx].icon)
                        .resizable()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .padding(.leading, 15)
                    
                    Text("\(self.mediaList[idx].name)")
                        .font(.title2)
                        .padding(.leading, 15)
                }
                    .toggleStyle(CheckboxStyle())
                    .frame(height: 50)
            }
            .onMove(perform: onMove)
        }
        .listStyle(.plain)
    }
    
    // MARK: - Private func

    private func onMove(from source: IndexSet, to destination: Int) {
        mediaList.move(fromOffsets: source, toOffset: destination)
    }
}

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.red)
                .font(.system(size: 20, weight: .regular, design: .default))
                .padding(.leading, -15)
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }
    }
}

struct EditList_Previews: PreviewProvider {
    static var previews: some View {
        EditList()
            .previewDevice("iPhone 13 Pro Max")
    }
}
