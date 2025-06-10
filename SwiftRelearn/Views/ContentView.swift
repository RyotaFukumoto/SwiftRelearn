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
        NavigationStack {
            List(viewModel.cats) { cat in
                NavigationLink(destination: CatDetailView(cat: cat)) {
                    VStack(alignment: .leading) {
                        Text("\(cat.name) (\(cat.age)歳)")
                        Text(cat.moodDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
