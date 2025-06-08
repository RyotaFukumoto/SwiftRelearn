//
//  ContentView.swift
//  SwiftRelearn
//
//  Created by Ryota F on 2025/06/08.
//

import SwiftUI

struct Cat {
    let name: String
    let age: Int
    let nickname: String?

    func introduce() -> String {
        return "こんにちは、私は \(name) です。 \(age) 歳です。"
    }

    func checkNickname() -> String {
        if let nickname = nickname {
            return "ニックネームは \(nickname) です。"
        } else {
            return "ニックネームは設定されていません。"
        }
    }
}

struct ContentView: View {
    // 定数の宣言
    let hijiki = Cat(name: "ひじき", age: 6, nickname: "ひじきちゃん")
    let tsukushi = Cat(name: "つくし", age: 4, nickname: nil)
    
    var body: some View {
        VStack(spacing: 20) {
            // 変数の宣言と初期化
            Text(hijiki.introduce())
            Text(hijiki.checkNickname())
            Text(tsukushi.introduce())
            Text(tsukushi.checkNickname())
        }
    }
}

#Preview {
    ContentView()
}
