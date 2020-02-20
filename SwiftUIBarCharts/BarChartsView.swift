//
//  BarChartsView.swift
//  SwiftUIBarCharts
//
//  Created by Aung Ko Min on 20/2/20.
//  Copyright © 2020 iowncode. All rights reserved.
//

import SwiftUI

struct BarChartsView: View {
    
    @State var pickerSelection = 0
    @State var barValues : [[(CGFloat)]] = [
        [5,150,50,100,200,110,30,170,50, 90],
        [200,110,30,170,50, 100,100,100,200, 180],
        [20, 40,60,80,100,120,140, 160, 180, 200]
    ]
    var body: some View {
        NavigationView {
            VStack{
            
                HStack(alignment: .center, spacing: 1){
                    
                    ForEach(barValues[pickerSelection], id: \.self){ data in
                        BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                    }
                }.animation(.default)
                
                Picker(selection: $pickerSelection, label: Text("Examples")){
                    Text("Example One").tag(0)
                    Text("Example Two").tag(1)
                    Text("Example Three").tag(2)
                }.pickerStyle(SegmentedPickerStyle()).padding()
                Spacer()
            }
            .navigationBarTitle("BarCharts")
        }
    }
    
    
    init() {
        //        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        //        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        //        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
}

struct BarView: View{
    
    var value: CGFloat
    var cornerRadius: CGFloat
    var maxValue = CGFloat(200)
    var textHeight = CGFloat(30)
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: 0).frame(height: maxValue + textHeight).foregroundColor(.white)
                VStack(spacing: 0) {
                    Text(Int(value).description).font(.caption).frame(height: textHeight)
                    RoundedRectangle(cornerRadius: 5).frame(height: value).foregroundColor(.accentColor)
                }
            }.frame(width: 30)
            Text(value.description).font(.footnote).rotationEffect(.degrees(90), anchor: .topLeading)
        }
        
    }
}


