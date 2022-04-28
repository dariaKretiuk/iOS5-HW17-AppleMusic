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
    
    func getSearch() -> [Search] {
        return [
            Search(icon: "prostr-audio-search", name: "Пространственное аудио"),
            Search(icon: "pop-russia-search", name: "Поп на русском"),
            Search(icon: "pop-search", name: "Поп"),
            Search(icon: "hip-hop-search", name: "Хип-хоп на русском"),
            Search(icon: "calmness-search", name: "Спокойствие"),
            Search(icon: "hits-search", name: "Хиты"),
            Search(icon: "siri-search", name: "Привет, Siri, включи..."),
            Search(icon: "hits-russia-search", name: "Хиты на русском"),
            Search(icon: "rock-russia-search", name: "Рок на русском"),
            Search(icon: "chats-search", name: "Чарты"),
            Search(icon: "dj-search", name: "DJ-миксы"),
            Search(icon: "sunrice-search", name: "Восход"),
            Search(icon: "hip-hop-search", name: "Хип-хоп"),
            Search(icon: "children-search", name: "Для детей"),
            Search(icon: "family-search", name: "Для семьи")
        ]
    }
    
    func getSearchCell() -> [[SearchCell]] {
        return [[
            SearchCell(icon: "", name: "(Deluxe)", nameAlbum: "Ed Sheeran", additionalInfo: "ПРОСТРАНСТВЕННОЕ АУДИО"),
            SearchCell(icon: "", name: "1 (2015 Version)", nameAlbum: "The Beatles", additionalInfo: "НОВИНКИ В ПРОСТРАНСТВЕННОМ АУДИО"),
            SearchCell(icon: "", name: "Multitude", nameAlbum: "Stromae", additionalInfo: "НОВИНКИ В ПРОСТРАНСТВЕННОМ АУДИО")
        ],
        [
            SearchCell(icon: "", name: "Создано для пространственного аудио", additionalInfo: "Apple Music"),
            SearchCell(icon: "", name: "Хиты в пространственном аудио", additionalInfo: "Apple Music"),
            SearchCell(icon: "", name: "Поп в пространственном аудио", additionalInfo: "Apple Music")
        ],
        [
            SearchCell(icon: "", name: "Феникс", additionalInfo: "ANNA ASTI"),
            SearchCell(icon: "", name: "Sweetest Pie", additionalInfo: "Megan Thee Stallion & Dua Lipa"),
            SearchCell(icon: "", name: "По полюшку", additionalInfo: "Akmal'"),
            SearchCell(icon: "", name: "Танцевали до утра", additionalInfo: "Леша Свик"),
            SearchCell(icon: "", name: "Он и Она", additionalInfo: "Jah Khalib & Akha"),
            SearchCell(icon: "", name: "Time Today", additionalInfo: "Moneybag"),
            SearchCell(icon: "", name: "Айсберг", additionalInfo: "Zivert"),
            SearchCell(icon: "", name: "Азбука", additionalInfo: "Boulevard Depo & SPAK"),
            SearchCell(icon: "", name: "Паранойя", additionalInfo: "XARISTA"),
            SearchCell(icon: "", name: "Tell To My Heart", additionalInfo: "Meduza"),
            SearchCell(icon: "", name: "Oh Na Na", additionalInfo: "Camila Cabello, Myke Towers & Tainy")
        ]
        ]
    }
    
    func getMiniPlayer() -> MiniPlayerData {
        return MiniPlayerData(icon: "SOAD", name: "SOAD", nameSing: "Sugar", duration: 252)
    }
}
