//
//  MacawChartView.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/11/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import Foundation
import Macaw
import UIKit
class MacawChartView : MacawView {
    static let maxVal = 6000
    static let maxValLineHeight =  180
    static let lineWidth = 275
    static let dataDivisor = Double(maxVal/maxValLineHeight)
    static let adjustData : [Double] = dataList.map({$0.cost/dataDivisor})
    static var animation : [Animation] = []
    static let dataList = createAggregateData(createData())
    let goals = [100, 8, 26, 30, 8, 800]
    
    required init(coder aDcoder: NSCoder) {
        super.init(node: MacawChartView.createChart(), coder : aDcoder)!
        backgroundColor = SettingViewController.globalBGcolor
    }


    //Group hold array of notes
    /**Create the overall Chart*/
    private  static func createChart ()  -> Group{
        var items: [Node] = addXAxisItems() + addYAxisItems()
        items.append(createBars())
        return Group(contents: items, place:.identity )
    }
    
    private  static func addYAxisItems () -> [Node]{
        let maxLine = 6
        let lineInterval = Int(maxVal/maxLine)
        let yAxisHeight : Double = 200
        let lineSpacing : Double = 30
        var newNodes : [Node] = []
        for i in 1...maxLine {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            let valueLine = Line(x1: -5, y1: y, x2: Double(lineWidth), y2: y).stroke(fill: Color.white.with(a: 0.10))
            let valueText = Text(text: "\(i * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            valueText.fill = Color.white
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).fill(with: Color.white.with(a: 0.25))
        newNodes.append(yAxis)
        return newNodes
    }
    
    private  static func addXAxisItems () -> [Node] {
        let chartBaseY : Double = 200
        var newNodes : [Node] = []
        for i in 1...adjustData.count {
            let x = (Double(i) * 50)
            let valueText = Text(text: "\(dataList[i - 1].cost)", align: .max, baseline: .mid, place: .move(dx: x, dy: chartBaseY
                + 15))
            //let name = Text(text: dataList[i - 1].category,  align: .max, baseline: .mid,  place: .move(dx: x - 20, dy: chartBaseY))
            valueText.fill =  Color.yellow
            newNodes.append(valueText)
            //newNodes.append(name)
        }
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: Double(lineWidth), y2: chartBaseY).stroke(fill:Color.white.with(a: 0.25) )
        newNodes.append(xAxis)
        return newNodes
    }
    
    private  static func createBars ()  -> Group{
        let fill = LinearGradient(degree: 90, from: Color(val: 0x85c5c7), to: Color(val: 0x85c5c7).with(a: 0.33))
        let items = adjustData.map { _ in Group()}
        animation = items.enumerated().map{
            (i: Int, item: Group) in
            item.contentsVar.animation(delay : Double(i) * 0.1) { t in
                let height = adjustData[i] * t
                let rect = Rect(x: Double(i) * 50 + 25,  y: 200 - height, w: 30, h: height)
                return [rect.fill(with: fill)]
            }
        }
        return items.group()
    }
    /**Add the date in*/
    private static func createData () -> [NewRecord]{
        let one   = NewRecord(cost: 400, itemName: "Banana", category: "Food", colorCode: UIColor.white)
        let six   = NewRecord(cost: 400, itemName: "Banana", category: "Food", colorCode: UIColor.gray)
        let seven   = NewRecord(cost: 400, itemName: "Banana", category: "Food", colorCode: UIColor.gray)

        let two   = NewRecord(cost: 1000, itemName: "School Fee", category: "Education", colorCode: UIColor.LRed1EXTEND())
        let three = NewRecord(cost: 2400, itemName: "Vocation", category: "Entertainment", colorCode: UIColor.grayL3EXTEND())
        let four  = NewRecord(cost: 1000, itemName: "Electric", category: "Bill", colorCode: UIColor.LYellow1EXTEND())
        let five  = NewRecord(cost: 200, itemName: "Tee Shirt", category: "Clothes", colorCode: UIColor.LBlue1EXTEND())
        return [one,two,three,four,five, six, seven]
    }
    /**Create a NewRecord array of each category*/
    private static func createAggregateData (_ data :[NewRecord]) -> [NewRecord]{
        var aggregateData : [NewRecord] = []
        let showOnlyACategory = SummarySpendViewController.selectedCategory
        
        for (n, record) in data.enumerated()
        {
            let tempCategory = record.category
            if n == 0 && showOnlyACategory == ""{
                aggregateData.append(record)
                
            } else
            {
                if showOnlyACategory != ""{
                    //only show one type
                    if showOnlyACategory == record.category {
                        if aggregateData.count > 0
                        {
                            aggregateData[0].cost = record.cost + aggregateData[0].cost
                        } else{
                            aggregateData.append(record)
                        }
                    }
                } else {
                    //show al type
                    for (m, newdata) in aggregateData.enumerated()
                    {
                        if tempCategory == newdata.category {
                            aggregateData[m].cost = newdata.cost + record.cost
                        } else
                        {
                            if m == aggregateData.count-1 {
                                aggregateData.append(record)
                            }
                        }
                    }

                }
            }
            
        }
        print ("value of aggregate data :\(aggregateData)")
    return aggregateData
        
    }
    static func playAnimation () {
        animation.combine().play()
    }
}
