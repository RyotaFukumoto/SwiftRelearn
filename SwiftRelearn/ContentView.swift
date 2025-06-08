//
//  ContentView.swift
//  SwiftRelearn
//
//  Created by Ryota F on 2025/06/08.
//

import SwiftUI

// Cat構造体の定義
struct Cat {
    // プロパティの宣言
    // letは定数、varは変数
    // プロパティはインスタンスごとに異なる値を持つことができる
    let name: String
    let age: Int
    let nickname: String?

    // メソッドの定義
    // メソッドはCat構造体のインスタンスに関連する機能を提供する
    // メソッドはインスタンスのプロパティにアクセスできる
    // メソッドは戻り値を持つことができる
    func introduce() -> String {
        return "こんにちは、私は \(name) です。 \(age) 歳です。"
    }

    // オプショナルプロパティのチェック
    // nicknameがnilでない場合はその値を返し、nilの場合はデフォルトのメッセージを返す
    // オプショナルは値が存在しない可能性があることを示す
    // オプショナルプロパティを使用することで、nilの可能性を扱うことができる
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
