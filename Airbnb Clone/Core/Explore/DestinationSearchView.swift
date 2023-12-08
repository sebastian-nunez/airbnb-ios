//
//  DestinationSearchView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/8/23.
//

import SwiftUI

struct DestinationSearchView: View {
    @Binding var showView: Bool

    var body: some View {
        VStack {
            // close button
            Button {
                withAnimation(.snappy) {
                    showView.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .foregroundStyle(.black.opacity(0.75))
                    .padding(.leading, 24)
                    .padding(.top, 8)

                Spacer()
            }

            Text("Where to?")

            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(showView: .constant(false))
}
