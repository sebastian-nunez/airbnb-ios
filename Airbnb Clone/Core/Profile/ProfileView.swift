//
//  ProfileView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/9/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                // header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)

                    Text("Login in to start planning your next trip")
                        .font(.subheadline)
                }

                Spacer()

                // login button
                Button {
                    print("DEBUG: Login") // TODO: implement auth flow with Firebase
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                // sign up
                HStack(spacing: 8) {
                    Text("Don't have an account?")

                    Button {
                        print("DEBUG: Sign up...") // TODO: implement sign up
                    } label: {
                        Text("Sign up")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .foregroundStyle(.foreground)
                }
                .font(.subheadline)

                Spacer()

                // settings
                VStack {
                    NavigationLink(value: "settings") {
                        ProfileOptionRowView(imageName: "gear", title: "Settings")
                    }

                    NavigationLink(value: "accessibility") {
                        ProfileOptionRowView(imageName: "accessibility", title: "Accessibility")
                    }
                    NavigationLink(value: "help") {
                        ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
                    }
                }
                .tint(.primary)
                .navigationDestination(for: String.self, destination: { _ in
                    Text("We're still working on it...")
                })
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
