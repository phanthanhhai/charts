//
//  MainViewController.swift
//  chart
//
//  Created by haipt on 3/28/16.
//  Copyright © 2016 viblo. All rights reserved.
//

import UIKit
let months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",
    "Oct", "Nov", "Dec"
]

let parties = [
    "Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
    "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
    "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
    "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
    "Party Y", "Party Z"
]

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chartBtnTouched(sender: AnyObject) {
        let btn = sender as! UIButton
        let tag = btn.tag
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        switch tag {
        case 1:
            let vc = mainStoryBoard.instantiateViewControllerWithIdentifier("LineChartViewController") as! LineChartViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            let vc = mainStoryBoard.instantiateViewControllerWithIdentifier("BarChartViewController") as! BarChartViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            let vc = mainStoryBoard.instantiateViewControllerWithIdentifier("CircleChartViewController") as! CircleChartViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
}
