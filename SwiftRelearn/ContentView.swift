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
}

struct ContentView: View {
    // 定数の宣言
    let hijiki = Cat(name: "ひじき", age: 6, nickname: "ひじきちゃん")
    let tsukushi = Cat(name: "つくし", age: 4, nickname: nil)
    
    var body: some View {
        VStack(spacing: 20) {
            // 変数の宣言と初期化
            Text(introduce(name: hijiki.name, age: hijiki.age))
            Text(checkNickname(nickname: hijiki.nickname))
            Text(introduce(name: tsukushi.name, age: tsukushi.age))
            Text(checkNickname(nickname: tsukushi.nickname))
            
        }
    }
    
    // 関数：名前と年齢を受け取り、自己紹介の文字列を返す関数
    // 目的：関数の定義と引数の使用方法を学ぶ
    func introduce(name: String,
                   age: Int,
    ) -> String {
        // \(変数名) を使って文字列に変数を埋め込む
        return "こんにちは、私は \(name) です。 \(age) 歳です。"
    }
    
    // Optionalの値を処理の例
    func checkNickname(nickname: String?) -> String {
        // nicknameがnilでない場合はアンラップして使用
        if let unwrapped = nickname {
            return "ニックネームは \(unwrapped) です。"
        } else {
            return "ニックネームは設定されていません。"
        }
    }
}

#Preview {
    ContentView()
}
