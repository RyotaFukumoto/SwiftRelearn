import Foundation

class CatViewModel: ObservableObject {
    @Published var cats: [Cat] = [] {
        didSet {
            saveCats()
        }
    }

    @Published var feedingStates: [UUID: FeedingState] = [:]

    private let catsKey = "savedCats"

    init() {
        loadCats()
    }

    func addCat(name: String, age: Int, nickname: String?, mood: CatMood) {
        let newCat = Cat(name: name, age: age, nickname: nickname, mood: mood)
        cats.append(newCat)
    }

    // 保存処理
    private func saveCats() {
        if let data = try? JSONEncoder().encode(cats) {
            UserDefaults.standard.set(data, forKey: catsKey)
        }
    }

    // 読み込み処理
    private func loadCats() {
        guard let data = UserDefaults.standard.data(forKey: catsKey),
              let savedCats = try? JSONDecoder().decode([Cat].self, from: data) else { return }

        self.cats = savedCats
    }

    func toggleFeeding(for cat: Cat) {
        let current = feedingStates[cat.id] ?? .hungry
        feedingStates[cat.id] = (current == .hungry) ? .fed : .hungry
    }
}

