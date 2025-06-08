//
//  ContentView.swift
//  SwiftRelearn
//
//  Created by Ryota F on 2025/06/08.
//

import SwiftUI

struct ContentView: View {
    // 定数の宣言
    let cats = [
        Cat(name: "ひじき", age: 6, nickname: "ひじきちゃん", mood: .happy),
        Cat(name: "つくし", age: 4, nickname: nil, mood: .hungry)
    ]
    
    // 猫ごとの給餌状態を管理
    @State private var feedingStates: [UUID: FeedingState] = [:]
    
    var body: some View {
        VStack(spacing: 20) {
            // 変数の宣言と初期化
            List(cats) { cat in
                VStack(alignment: .leading, spacing: 10) {
                    // 猫の名前と年齢を表示
                    Text("\(cat.name) (\(cat.age)歳)")
                    
                    // ニックネームの説明を表示
                    Text(cat.nicknameDescription)
                    
                    // 気分の説明を表示
                    Text(cat.moodDescription)
                    
                    // 給餌状態を表示
                    Text(feedingStates[cat.id]?.description ?? "まだごはんをあげていません。")
                    
                    // ボタンで給餌状態を更新
                    Button(action: {
                        // ボタンが押されたときの処理
                        toggleFeeding(for: cat)
                    }) {
                        Text(feedingStates[cat.id]?.buttonLabel ?? "ごはんをあげる")
                    }
                    .padding(.top, 5)
                }
                .padding(.vertical,5)
            }
        }
    }
    // 猫ごとの給餌状態をトグルする関数
    // この関数は、猫のIDを引数に取り、現在の給餌状態を切り替える
    private func toggleFeeding(for cat: Cat) {
          let current = feedingStates[cat.id] ?? .hungry
          let newState: FeedingState = current == .hungry ? .fed : .hungry
          feedingStates[cat.id] = newState
      }
}

#Preview {
    ContentView()
}
