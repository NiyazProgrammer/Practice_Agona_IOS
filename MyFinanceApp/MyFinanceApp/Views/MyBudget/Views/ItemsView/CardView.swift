import SwiftUI

struct CardView: View {
    var colors: [Color]
    var body: some View {

        ZStack {
            VStack(alignment: .leading) {
                Text("BankName")
                    .font(.system(size: 19, weight: .semibold, design: .default))

                Spacer()

                HStack {
                    Text("8568 ••••")

                    Spacer()

                    Image("masterCard")
                }
            }
            .padding()
        }
        .frame(width: 243, height: 153)
        .background(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
        .cornerRadius(15)
        .shadow(color: .accentColor.opacity(0.2), radius: 5, x: 4, y: 4)
        .padding()
    }
}

#Preview {
    CardView(colors: [Color("pink"), Color("lightPurple")])
}
