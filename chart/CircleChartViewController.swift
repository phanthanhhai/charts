//
//  CircleChartViewController.swift
//  chart
//
//  Created by haipt on 3/28/16.
//  Copyright © 2016 viblo. All rights reserved.
//

import UIKit
import Charts

class CircleChartViewController: UIViewController, ChartViewDelegate {
    @IBOutlet weak var chartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCircleChartView()
        self.setCircleChartData()
    }
    
    func setCircleChartView() {
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.58;
        chartView.transparentCircleRadiusPercent = 0.61;
        chartView.descriptionText = "Biểu đồ tròn"
        chartView.noDataTextDescription = "Bạn cần cung cấp dữ liệu cho biểu đồ"
        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        chartView.drawCenterTextEnabled = true
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        let legend = chartView.legend
        legend.xEntrySpace = 7.0
        legend.yEntrySpace = 0.0
        legend.yOffset = 0.0
        chartView.animate(xAxisDuration: 1.4)
    }
    
    func setCircleChartData() {
        chartView.data = nil
        var xVals: [String] = []
        var yVals: [ChartDataEntry] = []
        for i in 0...4 {
            xVals.append(parties[i % parties.count])
            let yValue = Double(arc4random_uniform(UInt32(i+30)))
            yVals.append(BarChartDataEntry(value: yValue, xIndex: i)) // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
        }
        let dataSet = PieChartDataSet(yVals: yVals, label: "Biểu đồ tròn")
        dataSet.sliceSpace = 2.0
        //add color
        var colors: [NSUIColor] = []
        colors.append(ChartColorTemplates.vordiplom()[0])
        colors.append(ChartColorTemplates.joyful()[0])
        colors.append(ChartColorTemplates.colorful()[0])
        colors.append(ChartColorTemplates.liberty()[0])
        colors.append(ChartColorTemplates.pastel()[0])
        dataSet.colors = colors
        var dataSets : [PieChartDataSet] = []
        dataSets.append(dataSet)
        let data = PieChartData(xVals: xVals, dataSets: dataSets)
        chartView.data = data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
