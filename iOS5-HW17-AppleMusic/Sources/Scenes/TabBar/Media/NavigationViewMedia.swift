import SwiftUI

struct NavigationViewMedia: View {
    
    // MARK: - Elements
    
    @State var isEditing = false
    @State private var editMode = EditMode.inactive
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            changeScreen
                .navigationTitle("Медиатека")
                .navigationBarItems(trailing: navigationBarItemTrailing)
                .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
        }
    }
    
    // MARK: - Private func
    
    private var navigationBarItemTrailing: some View {
        return AnyView(Button(action: actionButton) {
                Text(isEditing ? "Готово" : "Править")
                    .frame(width: 80, height: 40)
            })
    }
    
    private var changeScreen: some View {
        if isEditing {
            return AnyView(EditList())
        } else {
            return AnyView(SearchMusic())
        }
    }
    
    private func actionButton() {
        self.isEditing.toggle()
    }
}

struct NavigationViewMedia_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewMedia()
            .previewDevice("iPhone 13 Pro Max")
    }
}
