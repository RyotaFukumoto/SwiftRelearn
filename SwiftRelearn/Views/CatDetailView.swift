//
//  CatDetailView.swift
//  SwiftRelearn
//
//  Created by Ryota F on 2025/06/10.
//

import SwiftUI

struct CatDetailView: View {
    let cat: Cat
    @ObservedObject var viewModel: CatViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // 名前と年齢
            Text(cat.name)
                .font(.largeTitle)
                .bold()

            Text("\(cat.age)歳")
                .font(.title3)

            // ニックネーム
            Text(cat.nicknameDescription)

            // 気分
            Text(cat.moodDescription)

            // 給餌状態
            Text(viewModel.feedingStates[cat.id]?.description ?? "まだごはんをあげていません。")

            // ボタン
            Button(action: {
                viewModel.toggleFeeding(for: cat)
            }) {
                Text(viewModel.feedingStates[cat.id]?.buttonLabel ?? "ごはんをあげる")
            }
            .buttonStyle(CatButtonStyle())

            Spacer()
        }
        .padding()
        .navigationTitle("猫の詳細")
    }
}
