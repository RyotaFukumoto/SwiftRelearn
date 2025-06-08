// Cat.swift

import Foundation

// Cat構造体: 猫の情報をまとめるデータ型
struct Cat {
    // 名前（例: "ひじき"）
    let name: String
    // 年齢（例: 6）
    let age: Int
    // ニックネーム（nilの場合もある）
    let nickname: String?

    // 自己紹介文を返す計算プロパティ
    var introduce: String {
        return "こんにちは、私は \(name) です。 \(age) 歳です。"
    }

    // ニックネームの説明文を返す計算プロパティ
    // nicknameがnilなら未設定メッセージを返す
    var nicknameDescription: String {
        guard let unwrappedNickname = nickname else {
            return "ニックネームは設定されていません。"
        }
        return "ニックネームは \(unwrappedNickname) です。"
    }
}
