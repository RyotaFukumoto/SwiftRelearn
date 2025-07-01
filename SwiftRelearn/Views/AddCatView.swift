import SwiftUI

struct AddCatView: View {
    @ObservedObject var viewModel: CatViewModel

    // 入力用の一時変数
    @State private var name: String = ""
    @State private var ageText: String = ""
    @State private var nickname: String = ""
    @State private var selectedMood: CatMood = .happy

    // ナビゲーション用の環境変数（戻る）
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section(header: Text("猫の情報")) {
                TextField("名前", text: $name)
                TextField("年齢（数字）", text: $ageText)
                    .keyboardType(.numberPad)
                TextField("ニックネーム（任意）", text: $nickname)
            }

            Section(header: Text("気分")) {
                Picker("気分を選んでください", selection: $selectedMood) {
                    Text("幸せ").tag(CatMood.happy)
                    Text("眠い").tag(CatMood.sleepy)
                    Text("お腹が空いた").tag(CatMood.hungry)
                    Text("怒っている").tag(CatMood.angry)
                }
                .pickerStyle(.segmented)
            }

            Button("追加する") {
                // 入力チェックと追加処理
                guard let age = Int(ageText), !name.isEmpty else { return }
                let trimmedNickname = nickname.isEmpty ? nil : nickname
                viewModel.addCat(name: name, age: age, nickname: trimmedNickname, mood: selectedMood)
                dismiss()
            }
            .buttonStyle(CatButtonStyle())
        }
        .navigationTitle("猫を追加")
    }
}
