//
//  DropShadow.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/8/23.
//

import Foundation
import SwiftUI

struct DropShadow: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .shadow(color: .black.opacity(0.1), radius: 10)
    }
}
