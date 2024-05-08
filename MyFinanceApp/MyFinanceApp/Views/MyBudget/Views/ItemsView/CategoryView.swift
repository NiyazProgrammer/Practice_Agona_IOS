import SwiftUI

struct CategoryView: View {
    var iconName: String
    var color: Color
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(color.opacity(0.5))
                .frame(width: 40, height: 40)
            Image(systemName: iconName)
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}

#Preview {
    CategoryView(iconName: "tshirt.fill", color: .yellow)
}
