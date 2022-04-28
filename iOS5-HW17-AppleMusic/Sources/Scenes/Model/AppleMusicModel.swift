import Foundation

final class AppleMusicModel {
    
    func getMediaList() -> [MediaList] {
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
    
    func getStationRadio() -> [[Radio]] {
        return [[ Radio(icon: "light-pop", name: "Легкий поп", nameStation: "Станция Apple Music", additionalInfo: "ИЗБРАННАЯ РАДИОСТАНЦИЯ"),
                  Radio(icon: "hit", name: "Хиты", nameStation: "Станция Apple Music", additionalInfo: "ИЗБРАННАЯ РАДИОСТАНЦИЯ"),
                  Radio(icon: "hip-hop", name: "Хип-хоп", nameStation: "Станция Apple Music", additionalInfo: "ИЗБРАННАЯ РАДИОСТАНЦИЯ"),
                  Radio(icon: "pop", name: "Поп-музыка", nameStation: "Станция Apple Music", additionalInfo: "НОВЫЙ ВЫПУСК"),
                  Radio(icon: "rock", name: "Классика рока", nameStation: "Станция Apple Music", additionalInfo: "ИЗБРАННАЯ РАДИОСТАНЦИЯ"),
                  Radio(icon: "smus-music", name: "Смус-джаз", nameStation: "Станция Apple Music", additionalInfo: "ЭКСКЛЮЗИВ"),
                  Radio(icon: "chilout", name: "Чилаут", nameStation: "Станция Apple Music", additionalInfo: "ИЗБРАННАЯ РАДИОСТАНЦИЯ")
                ],
                [
                  Radio(icon: "alternativa-station", name: "Альтернатива", additionalInfo: "Станция Apple Music"),
                  Radio(icon: "child-station", name: "Колыбельные", additionalInfo: "Станция Apple Music"),
                  Radio(icon: "children-station", name: "Детские песни на русском", additionalInfo: "Станция Apple Music"),
                  Radio(icon: "classic-rock-station", name: "Классика рока", additionalInfo: "Станция Apple Music"),
                  Radio(icon: "hard-rock-station", name: "Хард-рок", additionalInfo: "Станция Apple Music"),
                  Radio(icon: "hit-2000-station", name: "Хиты 2000-х", additionalInfo: "Станция Apple Music"),
                  Radio(icon: "hit-2010-station", name: "Хиты 2010-х", additionalInfo: "Станция Apple Music"),
                  Radio(icon: "hit-all-time-station", name: "Хиты на все времена", additionalInfo: "Станция Apple Music")
                ]
        ]
    }
}
