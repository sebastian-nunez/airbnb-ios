//
//  Card.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/8/23.
//

import Foundation
import SwiftUI

struct Card: ViewModifier {
    var bgColor: Color

    func body(content: Content) -> some View {
        return content
            .padding()
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .dropShadow()
    }
}
