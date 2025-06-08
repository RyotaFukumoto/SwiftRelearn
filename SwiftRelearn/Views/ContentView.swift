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
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
