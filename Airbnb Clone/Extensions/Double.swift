//
//  Double.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/9/23.
//

import Foundation

extension Double {
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }

    func toPercentage() -> String {
        guard let numberAsString = percentFormatter.string(for: self) else {
            return "+0.00%"
        }

        return numberAsString + "%"
    }

    func printTo(_ decimalPlaces: Int) -> String {
        return String(format: "%.\(decimalPlaces)f", self)
    }

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()

        // config
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2

        return formatter
    }

    private var percentFormatter: NumberFormatter {
        let formatter = NumberFormatter()

        // config
        formatter.positivePrefix = "+"
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        return formatter
    }
}
