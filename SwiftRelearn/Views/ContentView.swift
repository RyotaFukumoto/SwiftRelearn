//
//  ContentView.swift
//  SwiftRelearn
//
//  Created by Ryota F on 2025/06/08.
//

import SwiftUI

struct ContentView: View {
    
    // 猫の給餌状態を管理する辞書
    @StateObject private var viewModel = CatViewModel()

    var body: some View {
        VStack(spacing: 20) {
            // 変数の宣言と初期化
            List(viewModel.cats) { cat in
                VStack(alignment: .leading, spacing: 10) {
                    // 猫の名前と年齢を表示
                    Text("\(cat.name) (\(cat.age)歳)")
                    
                    // ニックネームの説明を表示
                    Text(cat.nicknameDescription)
                    
                    // 気分の説明を表示
                    Text(cat.moodDescription)
                    
                    // 給餌状態を表示
                    Text(viewModel.feedingStates[cat.id]?.description ?? "お腹が空いています。")
                    
                    // ボタンで給餌状態を更新
                    Button(action: {
                        // ボタンが押されたときの処理
                        viewModel.toggleFeeding(for: cat)
                    }) {
                        // ボタンのラベルを表示
                        Text(viewModel.feedingStates[cat.id]?.buttonLabel ?? "ごはんをあげる")
                    }
                    .padding(.top, 5)
                }
                .padding(.vertical,5)
            }
        }
    }
}

#Preview {
    ContentView()
}
