//
//  AddCatView.swift
//  SwiftRelearn
//
//  Created by Ryota F on 2025/06/17.
//

import SwiftUI

struct AddCatView: View {
    @ObservedObject var viewModel: CatViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var nickname: String = ""
    @State private var mood: CatMood = .happy
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("名前と年齢")) {
                    TextField("名前", text: $name)
                    TextField("年齢", text: $age)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("ニックネーム")) {
                    TextField("ニックネーム（任意）", text: $nickname)
                }

                Section(header: Text("気分")) {
                    Picker("気分", selection: $mood) {
                        Text("幸せ").tag(CatMood.happy)
                        Text("眠い").tag(CatMood.sleepy)
                        Text("お腹すいた").tag(CatMood.hungry)
                        Text("怒ってる").tag(CatMood.angry)
                    }
                    .pickerStyle(.segmented)
                }

                Button("追加する") {
                    addCat()
                }
            }
            .navigationTitle("猫を追加")
        }
    }

    private func addCat() {
        // 年齢が整数に変換できるか確認
        guard let ageInt = Int(age), !name.isEmpty else { return }
        
        let nick = nickname.isEmpty ? nil : nickname
        viewModel.addCat(name: name, age: ageInt, nickname: nick, mood: mood)
        dismiss()
    }
}
