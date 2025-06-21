import Foundation

class CatViewModel: ObservableObject {
    @Published var cats: [Cat] = [] {
        didSet {
            saveCats()
        }
    }

    @Published var feedingStates: [UUID: FeedingState] = [:]

    // 保存用キー（UserDefaultsで使用）
    private let catsKey = "savedCats"
    private let feedingKey = "savedFeedingStates"
    
    init() {
        loadCats()
    }

    func addCat(name: String, age: Int, nickname: String?, mood: CatMood) {
        let newCat = Cat(name: name, age: age, nickname: nickname, mood: mood)
        cats.append(newCat)
    }

    // 保存する関数
    private func saveCats() {
        if let encodedCats = try? JSONEncoder().encode(cats) {
            UserDefaults.standard.set(encodedCats, forKey: catsKey)
        }
        if let encodedFeeding = try? JSONEncoder().encode(feedingStates) {
            UserDefaults.standard.set(encodedFeeding, forKey: feedingKey)
        }
    }

    // 読み込む関数
    private func loadCats() {
        if let catData = UserDefaults.standard.data(forKey: catsKey),
           let savedCats = try? JSONDecoder().decode([Cat].self, from: catData) {
            cats = savedCats
        }
        
        if let feedData = UserDefaults.standard.data(forKey: feedingKey),
           let savedFeeding = try? JSONDecoder().decode([UUID: FeedingState].self, from: feedData) {
            feedingStates = savedFeeding
        }
    }

    func toggleFeeding(for cat: Cat) {
        let current = feedingStates[cat.id] ?? .hungry
        feedingStates[cat.id] = (current == .hungry) ? .fed : .hungry
    }
}

