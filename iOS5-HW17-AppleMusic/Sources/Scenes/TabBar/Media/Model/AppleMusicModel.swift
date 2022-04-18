import Foundation

final class AppleMusicModel {
    
    func createModels() -> [MediaList] {
        return [MediaList(icon: "rectangle", name: "Плейлисты", isOn: false),
                 MediaList(icon: "music.mic", name: "Артисты", isOn: false),
                 MediaList(icon: "rectangle.stack", name: "Альбомы", isOn: false),
                 MediaList(icon: "music.note", name: "Песни", isOn: false),
                 MediaList(icon: "tv", name: "Телешоу и фильмы", isOn: false),
                 MediaList(icon: "music.note.tv", name: "Видеоклипы", isOn: false),
                 MediaList(icon: "guitars", name: "Жанры", isOn: false),
                 MediaList(icon: "person.2.crop.square.stack", name: "Сборники", isOn: false),
                 MediaList(icon: "music.quarternote.3", name: "Авторы", isOn: false),
                 MediaList(icon: "arrow.down.circle", name: "Загружено", isOn: false),
                 MediaList(icon: "music.note.house", name: "Дополнительно", isOn: false)]
    }
}
