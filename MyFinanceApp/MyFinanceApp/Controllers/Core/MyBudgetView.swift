import SwiftUI
import Slideshow

struct MyBudgetView: View {
    @ObservedObject var model: MyBudgetViewModel
//    @StateObject private var model = MyBudgetViewModel(
//            repository: BankCardRepositoryImpl(
//                localService: LocalBankCardService(), remoteService: RemoteBankCardService())
//            )
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(model: model)
                BankCardsView(model: model)
                AddCardButton(model: model)
                LastActivitySection(model: model)
                Spacer()
            }
            .background(Color.gray.opacity(0.1))
            .onAppear {
                model.loadData()
            }
        }.navigationBarHidden(true)
    }
}

struct HeaderView: View {
    @ObservedObject var model: MyBudgetViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Всего денег")
                        .foregroundStyle(.gray)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 7, height: 9)
                        .foregroundStyle(.blue)
                }.padding([.leading])

                Text(model.totalMoney, format: .currency(code: "RUB"))
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.leading)
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundStyle(.gray).opacity(0.3))

            Spacer()

            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.leading, 10)
        }
        .padding()
    }
}

struct BankCardsView: View {
    @ObservedObject var model: MyBudgetViewModel

    var body: some View {
        VStack {
            // MARK: Старая реализация со ScrollView
            //                ScrollView(.horizontal, showsIndicators: false) {
            //                    HStack(spacing: 0) {
            //                        ForEach(self.$model.bankCards) { card in
            //                            VStack {
            //                                GeometryReader { geo in
            //                                    NavigationLink(destination: DetailOperationScreenView(operations: model.operations)) { //
            //                                        CardView(bankCard: card)
            //                                            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 15),
            //                                                              axis: (x: 0, y: 1, z: 0))
            //                                    }
            //                                }
            //                                .frame(width: 300, height: 210)
            //                                .scrollTargetBehavior(.paging)
            //                            }
            //                        }
            //                    }
            //                }
            if !model.bankCards.isEmpty {
                Slideshow($model.bankCards, index: $model.selectedCardIndex) { slide in
                    VStack {
                        GeometryReader { geo in
                            NavigationLink(destination: DetailOperationScreenView(model: DetailScreenViewModel(transactions: model.selectedBankCard?.transactions ?? []))) {
                                CardView(bankCard: slide)
                                    .scaleEffect(1.0 - abs(geo.frame(in: .global).midX - UIScreen.main.bounds.width / 2) / UIScreen.main.bounds.width)
                                    .opacity(Double(1.0 - abs(geo.frame(in: .global).midX - UIScreen.main.bounds.width / 2) / UIScreen.main.bounds.width))
                            }
                        }
                        .frame(width: 300, height: 220)
                    }
                }
                .frame(height: 210)
                .padding(.horizontal)
                .onChange(of: model.selectedCardIndex) { _ in
                    model.updateOperationsForSelectedCard()
                }
            } else {
                Text("Нет доступных карточек")
                    .foregroundColor(.red)
            }
        }
    }
}

struct AddCardButton: View {
    @ObservedObject var model: MyBudgetViewModel

    var body: some View {
        NavigationLink(destination: AddCardView()) {
            HStack {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Add Card")
                    .font(.title)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(LinearGradient(colors: [.blue, .purple, .pink],
                                       startPoint: .leading, endPoint: .trailing))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding()
        }
    }
}

struct LastActivitySection: View {
    @ObservedObject var model: MyBudgetViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Last activity")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
            }
            .padding()

            List(model.selectedBankCard?.transactions ?? []) { value in
//                LastActivityRowView(
//                                    activityObj: Transaction(id: UUID(),
//                                    name: value.name,
//                                    date: value.date,
//                                    price: value.signedAmount,
//                                    type: value.type,
//                                    transactionCategory: value.transactionCategory))
            }
            .listStyle(.plain)
        }
    }
}
