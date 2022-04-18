import SwiftUI

struct MediaList: Identifiable {
    let id = UUID()
    var icon: String
    var name: String
    var isOn: Bool
}

struct Radio: Hashable {
    var icon: String
    var name: String
    var nameStation: String?
    var additionalInfo: String
}

struct RadioStation {
    var icon: String
    var name: String
    var descriptionStation: String
}
