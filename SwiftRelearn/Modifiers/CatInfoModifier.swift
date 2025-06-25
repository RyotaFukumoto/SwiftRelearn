import SwiftUI

// Catの情報に使うスタイルModifier
struct CatInfoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)    // フォントを太字の見出し（headline）に設定
            .foregroundColor(.orange)   // 文字色をオレンジ色に設定
            .padding(8) // 8ポイントのパディングを追加
            .background(Color(.systemGray6))    // 背景色をシステムグレー6に設定
            .cornerRadius(10)   // 角を10ポイントの半径で丸める
    }
}

// .modifier()を簡潔に使えるように拡張
extension View {
    func catInfoStyle() -> some View {
        self.modifier(CatInfoModifier())
    }
}
