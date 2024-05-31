import SwiftUI
import UIKit

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if viewModel.showLoading {
                    LoadingView()
                        .onAppear {
                            viewModel.goToApp()
                        }
                } else {
                    VStack(spacing: 20) {
                        Text("Register")
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
                            Text("Username")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            TextField("Enter your username", text: $viewModel.username)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
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

                        VStack(alignment: .leading) {
                            Text("Confirm Password")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack {
                                if viewModel.showPassword {
                                    TextField("Confirm your password", text: $viewModel.confirmPassword)
                                } else {
                                    SecureField("Confirm your password", text: $viewModel.confirmPassword)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        }

                        Button(action: {
                            Task {
                                await viewModel.registerUser()
                            }
                        }) {
                            Text("Sign Up")
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
                            Text("Already have an account?")
                            NavigationLink(destination: LoginView()) {
                                Text("Log In")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding()
                    .onAppear {
                        if viewModel.isAuthenticated {
                            viewModel.goToApp()
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    RegisterView()
}
