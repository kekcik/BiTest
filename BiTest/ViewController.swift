//
//  ViewController.swift
//  BiTest
//
//  Created by Ivan Trofimov on 13/02/2019.
//  Copyright © 2019 Ivan Trofimov. All rights reserved.
//

import UIKit
import SciChart

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLable: UILabel!
    @IBOutlet weak var chartView: UIView!
    
    var sciChartSurface: SCIChartSurface?
    
    var scatterDataSeries = SCIXyDataSeries(xType: .double, yType: .double)
    var scatterRenderableSeries = SCIFastLineRenderableSeries()
    var xAxes = SCINumericAxis()
    var yAxes = SCINumericAxis()
    var pointManager: PointManager? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureChart()
        pointManager = PointManager(view: self)
    }
    
    func configureChart() {
        
        sciChartSurface = SCIChartSurface(frame: chartView.bounds)
        guard let surface = sciChartSurface else { return }
        surface.translatesAutoresizingMaskIntoConstraints = true
        
        DispatchQueue.main.async { [weak self] in
            self?.chartView?.addSubview(surface)
        }
        
        xAxes.growBy = SCIDoubleRange(min: 5, max: 5)
        surface.xAxes.add(xAxes)
        
        yAxes.growBy = SCIDoubleRange(min: 0.5, max: 0.5)
        surface.yAxes.add(yAxes)
        
        scatterDataSeries.acceptUnsortedData = true
        
        scatterRenderableSeries.strokeStyle = SCISolidPenStyle(color: UIColor.orange.withAlphaComponent(0.4), withThickness: 1.0)
        surface.renderableSeries.add(scatterRenderableSeries)
        xAxes.visibleRange = SCIDoubleRange(min: -20, max: 5)
        surface.animateZoomExtents(0.5)
        
    }
}

extension ViewController: ChartView {
    
    func add(point: Point) {
        scatterDataSeries.appendRangeX([point.x], y: [point.y])
        scatterRenderableSeries.dataSeries = scatterDataSeries
        
        let oldText = sciChartSurface?.annotations.item(byName: "text")
        let oldLine = sciChartSurface?.annotations.item(byName: "line")
        sciChartSurface?.annotations.remove(oldLine)
        sciChartSurface?.annotations.remove(oldText)
        // остается много старых boxes. Не гут
        
        let horizontalLine = SCIHorizontalLineAnnotation(point: point)
        let boxAnnotation = SCIBoxAnnotation(point: point)
        let textAnnotation = SCITextAnnotation(point: point)
        sciChartSurface?.annotations.add(horizontalLine)
        sciChartSurface?.annotations.add(boxAnnotation)
        if point.delta > 0.2 || point.delta < -0.2 {
            sciChartSurface?.annotations.add(textAnnotation)
        }
        
        xAxes.visibleRangeLimit = SCIDoubleRange(min: point.x - 20, max: point.x + 5)
        sciChartSurface?.animateZoomExtents(0.5)
        updateLabel(count: point.y - point.delta, delta: point.delta)
    }
    
    func updateLabel(count: Double, delta: Double) {
        let result = NSMutableAttributedString()
        let countAS = NSAttributedString(
            string: "Курс: \(count.roundedString)\n",
            attributes: [.foregroundColor: UIColor.black])
        let deltaAS = NSAttributedString(
            string: "\(delta < 0 ? "↓" : "↑") \(delta.roundedString) \(delta < 0 ? "🥺" : "🤑")",
            attributes: [.foregroundColor: (delta < 0 ? UIColor.red : .green)])
        result.append(countAS)
        result.append(deltaAS)
        statusLable.attributedText = result
    }
    
}
