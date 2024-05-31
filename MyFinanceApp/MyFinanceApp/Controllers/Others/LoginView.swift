import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if viewModel.showLoading {
                    LoadingView()
                        .onAppear {
                            viewModel.goToApp()
                        }
                } else {
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.semibold)

                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        TextField("Enter your email", text: $viewModel.email)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .keyboardType(.emailAddress)
                    }

                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        HStack {
                            if viewModel.showPassword {
                                TextField("Enter your password", text: $viewModel.password)
                            } else {
                                SecureField("Enter your password", text: $viewModel.password)
                            }
                            Button(action: {
                                viewModel.showPassword.toggle()
                            }) {
                                Image(systemName: viewModel.showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }

                    Button(action: {
                        Task {
                            await viewModel.loginUser()
                        }
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
                    }

                    Spacer()

                    HStack {
                        Text("Don't have an account?")
                        NavigationLink(destination: RegisterView()) {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
        .padding()
    }
}



#Preview {
    LoginView()
}
