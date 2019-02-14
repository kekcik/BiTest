//
//  PointManager.swift
//  BiTest
//
//  Created by Ivan Trofimov on 14/02/2019.
//  Copyright © 2019 Ivan Trofimov. All rights reserved.
//

import Foundation

struct Point {
    var x: Double
    var y: Double
    var delta: Double
}

// Для добавления точек на какой-либо ChartView необходимо удолитворяет протоколу
protocol ChartView {
    func add(point: Point)
}

class PointManager {
    
    var timer: Timer? = nil
    var count = 0.0
    var firstTime = NSDate().timeIntervalSince1970
    var view: ChartView? = nil
    
    init(view: ChartView) {
        self.view = view
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in self.getNextValue() }
    }
    
    deinit {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    func getNextValue() {
        let rand = Double.random(in: -1..<1)
        let y = count + rand
        let x = NSDate().timeIntervalSince1970 - firstTime
        count += rand
        view?.add(point: Point(x: x, y: y, delta: rand))
    }
    
}
