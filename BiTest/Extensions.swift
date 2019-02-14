//
//  Extensions.swift
//  BiTest
//
//  Created by Ivan Trofimov on 14/02/2019.
//  Copyright © 2019 Ivan Trofimov. All rights reserved.
//

import Foundation
import SciChart

extension Double {
    var roundedString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4
        return formatter.string(from: self as NSNumber) ?? ""
    }
}

extension SCILineAnnotationLabel {
    convenience init(text: String, labelPlacement: SCILabelPlacement, color: UIColor, backColor: UIColor) {
        self.init()
        self.text = text
        style.backgroundColor = backColor
        style.labelPlacement = labelPlacement
        style.textStyle.color = color
    }
}

extension SCIHorizontalLineAnnotation {
    convenience init(point: Point) {
        self.init()
        x1 = SCIGenericType(type: .double, .init(doubleData: point.x))
        y1 = SCIGenericType(type: .double, .init(doubleData: point.y))
        style.linePen = SCISolidPenStyle(color: UIColor.orange, withThickness: 1)
        add(SCILineAnnotationLabel(text: point.y.roundedString, labelPlacement: .axis, color: UIColor.black, backColor: UIColor.orange))
        annotationName = "line"
    }
}

extension SCIBoxAnnotation {
    convenience init(point: Point) {
        self.init()
        x1 = SCIGenericType(type: .double, .init(doubleData: point.x))
        y1 = SCIGenericType(type: .double, .init(doubleData: point.y))
        x2 = SCIGenericType(type: .double, .init(doubleData: point.x - 0.9))
        y2 = SCIGenericType(type: .double, .init(doubleData: point.y - point.delta))
        style.fillBrush = SCISolidBrushStyle(colorCode: point.delta > 0 ? 0x55279B27 : 0x55FF1919)
        style.borderPen = SCISolidPenStyle(colorCode: 0x55FF1919, withThickness: 0.0)
    }
}

extension SCITextAnnotation {
    convenience init(point: Point) {
        self.init()
        x1 = SCIGenericType(type: .double, .init(doubleData: point.x + 0.3))
        y1 = SCIGenericType(type: .double, .init(doubleData: point.y - point.delta / 2))
        text = point.delta.roundedString
        horizontalAnchorPoint = .left
        verticalAnchorPoint = .center
        style.textColor = UIColor.white
        style.textStyle.fontSize = 12
        annotationName = "text"
    }
}

extension SCIDoubleRange {
    convenience init(min: Double, max: Double) {
        self.init(
            min: SCIGenericType(type: .double, .init(doubleData: min)),
            max: SCIGenericType(type: .double, .init(doubleData: max))
        )
    }
}
