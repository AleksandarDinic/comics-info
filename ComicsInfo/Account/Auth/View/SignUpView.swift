//
//  SignUpView.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 18/12/2021.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var alertController: AlertController
    @ObservedObject private var viewModel = SignUpViewModel()
    @Binding var showSignIn: Bool
    @FocusState private var focusedField: SignUpViewModel.Field?
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 4) {
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    if !viewModel.showConfirmCode {
                        makeUsernameInputView()
                        makeEmailInputView()
                        makePasswordInputView()

                        makeSignUpButton()
                        makeSignInButton()
                    } else {
                        VerificationCodeView(
                            alertController: alertController,
                            username: viewModel.username,
                            password: viewModel.password
                        )
                    }

                    Spacer()
                }
                .padding()
            }
            .onSubmit {
                switch focusedField {
                case .username:
                    focusedField = .email
                case .email:
                    focusedField = .password
                case .password:
                    viewModel.signUp()
                case .none:
                    break
                }
            }
            
            if viewModel.isLoading {
                MainProgressView()
            }
        }
        .onAppear {
            viewModel.alertController = alertController
        }
    }
    
    private func makeUsernameInputView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Username")
                .font(.body)
            HStack {
                Image(systemName: "person")
                    .opacity(viewModel.imageOpacity())
                TextField("Username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textContentType(.username)
                    .focused($focusedField, equals: .username)
                    .disabled(viewModel.isInputDisabled())
                    .opacity(viewModel.inputOpacity())
                    .submitLabel(.next)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.accentColor, lineWidth: 1)
                    .opacity(viewModel.inputOpacity())
            )
        }
        .padding(8)
    }
    
    private func makeEmailInputView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Email")
                .font(.body)
            HStack {
                Image(systemName: "envelope")
                    .opacity(viewModel.imageOpacity())
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .focused($focusedField, equals: .email)
                    .disabled(viewModel.isInputDisabled())
                    .opacity(viewModel.inputOpacity())
                    .submitLabel(.next)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.accentColor, lineWidth: 1)
                    .opacity(viewModel.inputOpacity())
            )
        }
        .padding(8)
    }
    
    private func makePasswordInputView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Password (min \(Environment.passwordMinLength) characters)")
                .font(.body)
            HStack {
                Image(systemName: "key")
                    .opacity(viewModel.imageOpacity())
                SecureField("Password", text: $viewModel.password)
                    .autocapitalization(.none)
                    .textContentType(.newPassword)
                    .focused($focusedField, equals: .password)
                    .disabled(viewModel.isInputDisabled())
                    .opacity(viewModel.inputOpacity())
                    .submitLabel(.join)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.accentColor, lineWidth: 1)
                    .opacity(viewModel.inputOpacity())
            )
        }
        .padding(8)
    }
    
    private func makeSignUpButton() -> some View {
        Button(action: {
            viewModel.signUp()
        }) {
            Text("Sign Up")
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            .cornerRadius(8)
        }
        .padding(8)
        .disabled(viewModel.isSignUpDisabled())
    }
    
    private func makeSignInButton() -> some View {
        Button(action: {
            showSignIn.toggle()
        }) {
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.secondary)
                Text("Sign in")
            }
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
        }
        .padding(8)
        .disabled(viewModel.isInputDisabled())
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    
    @State static private var showSignIn = false
    
    static var previews: some View {
        SignUpView(showSignIn: $showSignIn)
    }

}
