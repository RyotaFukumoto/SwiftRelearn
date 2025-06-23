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

    // 初期化時にデータを読み込む
    init() {
        loadCats()
        loadFeedingStates()
    }

    // 猫を追加する
    func addCat(name: String, age: Int, nickname: String?, mood: CatMood) {
        let newCat = Cat(name: name, age: age, nickname: nickname, mood: mood)
        cats.append(newCat)
    }

    // 猫の配列を保存
    private func saveCats() {
        if let encodedCats = try? JSONEncoder().encode(cats) {
            UserDefaults.standard.set(encodedCats, forKey: catsKey)
        }
    }

    // 猫の配列を読み込む
    private func loadCats() {
        if let catData = UserDefaults.standard.data(forKey: catsKey),
           let savedCats = try? JSONDecoder().decode([Cat].self, from: catData) {
            cats = savedCats
        }
    }

    // 給餌状態を保存
    private func saveFeedingStates() {
        if let data = try? JSONEncoder().encode(feedingStates) {
            UserDefaults.standard.set(data, forKey: feedingKey)
        }
    }

    // 給餌状態を読み込む
    private func loadFeedingStates() {
        if let data = UserDefaults.standard.data(forKey: feedingKey),
           let savedStates = try? JSONDecoder().decode([UUID: FeedingState].self, from: data) {
            feedingStates = savedStates
        }
    }

    // 給餌状態のトグル（切り替え）
    func toggleFeeding(for cat: Cat) {
        let current = feedingStates[cat.id] ?? .hungry
        feedingStates[cat.id] = (current == .hungry) ? .fed : .hungry
        saveFeedingStates()
    }
}
