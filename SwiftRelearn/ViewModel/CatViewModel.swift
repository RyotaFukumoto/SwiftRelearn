import Foundation

class CatViewModel: ObservableObject {
    // ObservableObjectプロトコルに準拠し、@Publishedプロパティを使用してUI更新を通知する
    @Published var cats: [Cat] = [
        Cat(name: "ひじき", age: 6, nickname: "ひじきちゃん", mood: .happy),
        Cat(name: "つくし", age: 4, nickname: nil, mood: .hungry)
    ]
    // 猫ごとの給餌状態を管理するための辞書
    @Published var feedingStates: [UUID: FeedingState] = [:]

    // 猫のリストを取得する関数
    func toggleFeeding(for cat: Cat) {
        let current = feedingStates[cat.id] ?? .hungry
        feedingStates[cat.id] = (current == .hungry) ? .fed : .hungry
    }
    
    func addCat(name: String, age: Int, nickname: String?, mood: CatMood) {
        let newCat = Cat(name: name, age: age, nickname: nickname, mood: mood)
        cats.append(newCat)
    }
}
