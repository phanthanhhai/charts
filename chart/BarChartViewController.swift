//
//  BarChartViewController.swift
//  chart
//
//  Created by haipt on 3/28/16.
//  Copyright © 2016 viblo. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController, ChartViewDelegate {
    @IBOutlet weak var chartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initBarChart()
        self.setBarChartData()
    }
    
    func initBarChart() {
        chartView.delegate = self
        chartView.descriptionText = "Biểu đồ cột"
        chartView.noDataTextDescription = "Bạn cần cung cấp dữ liệu cho biểu đồ"
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.drawGridBackgroundEnabled = false
        chartView.rightAxis.enabled = true
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = true
        chartView.maxVisibleValueCount = 60
        chartView.legend.formSize = 9.0;
        chartView.legend.font = UIFont.systemFontOfSize(11)
        chartView.legend.xEntrySpace = 4.0;
        chartView.animate(xAxisDuration: 1.4)
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelCount = 8
        leftAxis.valueFormatter = NSNumberFormatter()
        leftAxis.valueFormatter?.maximumIntegerDigits = 1
        leftAxis.spaceTop = 0.15
        leftAxis.customAxisMin = 0
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = true
        rightAxis.drawGridLinesEnabled = false
        rightAxis.labelFont = UIFont.systemFontOfSize(10)
        rightAxis.labelCount = 8
        rightAxis.valueFormatter = leftAxis.valueFormatter
        rightAxis.spaceTop = 0.15
        rightAxis.customAxisMin = 0.0
    }
    
    func setBarChartData() {
        chartView.data = nil
        var xVals: [String] = []
        var yVals: [ChartDataEntry] = []
        for i in 0...11 {
            xVals.append(months[i])
            let yValue = Double(arc4random_uniform(UInt32(i+10)))
            yVals.append(BarChartDataEntry(value: yValue, xIndex: i))
        }
        let set1 = BarChartDataSet(yVals: yVals, label: "Biểu đồ cột")
        set1.barSpace = 0.35
        var dataSets : [BarChartDataSet] = []
        dataSets.append(set1)
        let data = BarChartData(xVals: xVals, dataSets: dataSets)
        chartView.data = data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
