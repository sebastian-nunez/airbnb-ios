//
//  View.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/8/23.
//

import Foundation
import SwiftUI

extension View {
    func cardStyle(in color: Color = .foregroundAccent) -> some View {
        return modifier(Card(bgColor: color))
    }

    func dropShadow() -> some View {
        return modifier(DropShadow())
    }
}
