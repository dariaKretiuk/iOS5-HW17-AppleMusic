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

struct Search: Hashable {
    var icon: String
    var name: String
}

struct SearchCell: Hashable {
    var icon: String
    var name: String
    var nameAlbum: String?
    var additionalInfo: String
}

struct MiniPlayerData {
    var icon: String
    var name: String
    var nameSing: String
    var duration: Int
}
