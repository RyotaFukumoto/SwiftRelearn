// Cat.swift

import Foundation

enum CatMood {
    case happy
    case sleepy
    case hungry
    case angry
}

// Cat構造体: 猫の情報をまとめるデータ型
struct Cat:Identifiable {
    // Identifiableプロトコルに準拠するためのID
    var id: UUID = UUID()
    // 名前（例: "ひじき"）
    let name: String
    // 年齢（例: 6）
    let age: Int
    // ニックネーム（nilの場合もある）
    let nickname: String?
    // 気分
    let mood: CatMood

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

    // 気分を表す文字列を返す計算プロパティ
    var moodDescription: String {
        switch mood {
        case .happy:
            return "私はとても幸せです！"
        case .sleepy:
            return "私は眠いです。"
        case .hungry:
            return "お腹が空いています。"
        case .angry:
            return "私は怒っています！"
        }
    }
}
