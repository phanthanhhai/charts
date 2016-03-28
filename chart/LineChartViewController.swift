//
//  LineChartViewController.swift
//  chart
//
//  Created by haipt on 3/28/16.
//  Copyright © 2016 viblo. All rights reserved.
//

import UIKit
import Charts
class LineChartViewController: UIViewController, ChartViewDelegate {
    @IBOutlet weak var chartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initLineChart()
        self.setLineChartData()
    }
    
    func initLineChart () {
        chartView.delegate = self
        chartView.descriptionText = "Biểu đồ đường biểu diễn"
        chartView.noDataTextDescription = "Bạn cần cung cấp dữ liệu cho biểu đồ"
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.drawGridBackgroundEnabled = false
        chartView.rightAxis.enabled = false
        chartView.viewPortHandler.setMaximumScaleY(2)
        chartView.viewPortHandler.setMaximumScaleX(2)
        chartView.animate(xAxisDuration: 2.5, easingOption: ChartEasingOption.EaseInOutQuart)
        
        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.customAxisMax = 200;
        leftAxis.customAxisMin = -200;
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.drawZeroLineEnabled = false
        leftAxis.drawLimitLinesBehindDataEnabled = true
    }

    func setLineChartData() {
        chartView.data = nil
        var xVals: [String] = []
        var yVals: [ChartDataEntry] = []
        var index: Int = 0
        for(var i: Double = 0; i < 20; i += 0.5) {
            xVals.append("\(i)")
            let yValue = 100 * sin(i)
            yVals.append(ChartDataEntry(value: yValue, xIndex: index))
            index += 1
        }
        
        let set1 = LineChartDataSet(yVals: yVals, label: "Biểu đồ đường biểu diễn")
        set1.lineDashLengths = [5, 2.5]
        set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(UIColor.blueColor())
        set1.setCircleColor(UIColor.blueColor())
        set1.lineWidth = 1
        set1.circleRadius = 5.0
        set1.drawCircleHoleEnabled = false
        set1.valueFont = UIFont.systemFontOfSize(10)
        set1.drawFilledEnabled = true
        var dataSets : [LineChartDataSet] = []
        dataSets.append(set1)
        let data = LineChartData(xVals: xVals, dataSets: dataSets)
        chartView.data = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
