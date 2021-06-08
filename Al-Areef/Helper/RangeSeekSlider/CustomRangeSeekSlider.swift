//
//  CustomRangeSeekSlider.swift
//  RangeSeekSlider
//
//  Created by Keisuke Shoji on 2017/03/16.
//
//

import UIKit

@IBDesignable final class CustomRangeSeekSlider: RangeSeekSlider {

    fileprivate let prices: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24,
        ]

    override func setupStyle() {
        let pink: UIColor = #colorLiteral(red: 0.0000000000, green: 0.5019607843, blue: 0.0000000000, alpha: 1) // greenCSS3 #008000
        let gray: UIColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1) // gray #808080

        minValue = 0.0
        maxValue = CGFloat(prices.count - 1)
        selectedMinValue = 15.0
        selectedMaxValue = CGFloat(prices.count - 1)
        minDistance = 1.0
        handleColor = pink
        minLabelColor = pink
        maxLabelColor = pink
        colorBetweenHandles = pink
        tintColor = gray
        numberFormatter.locale = Locale(identifier: "ja_JP")
        numberFormatter.numberStyle = .currency
        labelsFixed = true
        initialColor = gray

        delegate = self
    }

    fileprivate func priceString(value: CGFloat) -> String {
        let index: Int = Int(roundf(Float(value)))
        let price: Int = prices[index]
        let priceString: String? = "\(price)"//numberFormatter.string(from: price as NSNumber)
        return (priceString ?? "") + " h"
    }
}


// MARK: - RangeSeekSliderDelegate

extension CustomRangeSeekSlider: RangeSeekSliderDelegate {

    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMinValue minValue: CGFloat) -> String? {
        return priceString(value: minValue)
    }

    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMaxValue maxValue: CGFloat) -> String? {
        return priceString(value: maxValue)
    }
}
