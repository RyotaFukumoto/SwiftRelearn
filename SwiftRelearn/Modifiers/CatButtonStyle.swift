import SwiftUI

struct CatButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()  //  パディングを追加
            .background(configuration.isPressed ? Color.orange : Color.blue) // 背景色を設定
            .foregroundColor(.white) // 文字色を白に設定
            .cornerRadius(8) // 角を丸める
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // 押されたときに少し縮小
    }
}
