//
//  CatDetailView.swift
//  SwiftRelearn
//
//  Created by Ryota F on 2025/06/10.
//

import SwiftUI

struct CatDetailView: View {
    let cat: Cat

    var body: some View {
        VStack(spacing: 20) {
            Text(cat.name)
                .font(.largeTitle)

            Text("\(cat.age)歳")
            Text(cat.nicknameDescription)
            Text(cat.moodDescription)
        }
        .navigationTitle("詳細")
        .padding()
    }
}
