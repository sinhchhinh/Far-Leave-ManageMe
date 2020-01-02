//
//  MacawChartView.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/11/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import Foundation
import Macaw
class MacawChartView : MacawView {
    static let maxVal = 1000
    static let maxValLineHeight =  180
    static let lineWidth = 275
    static let dataDivisor = Double(maxVal/maxValLineHeight)
    static let adjustData : [Double] = dataList.map({$0.cost/dataDivisor})
    static var animation : [Animation] = []
    static let dataList = createData()
    let goals = [100, 8, 26, 30, 8, 800]

    required init(coder aDcoder: NSCoder) {
        super.init(node: MacawChartView.createChart(), coder : aDcoder)!
        backgroundColor = .clear
        
    }
    //Group hold array of notes
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
            valueText.fill = Color.blue
            newNodes.append(valueText)
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
    private static func createData () -> [NewRecord]{
        let one = NewRecord(cost: 200)
        let two = NewRecord(cost: 20)
        let three = NewRecord(cost: 500)
        let four = NewRecord(cost: 300)
        let five = NewRecord(cost: 160)
        return [one,two,three,four,five]
    }
    static func playAnimation () {
        animation.combine().play()
    }
}
