import SwiftUI

// Catの情報に使うスタイルModifier
struct CatInfoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.orange)
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

// .modifier()を簡潔に使えるように拡張
extension View {
    func catInfoStyle() -> some View {
        self.modifier(CatInfoModifier())
    }
}
