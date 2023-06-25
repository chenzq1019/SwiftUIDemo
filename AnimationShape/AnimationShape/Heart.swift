//
//  Heart.swift
//  AnimationShape
//
//  Created by 陈竹青 on 2023/6/19.
//

import SwiftUI

struct Heart : Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.height/4),
                      control1: CGPoint(x: rect.midX, y: rect.height*3/4),
                      control2: CGPoint(x: rect.minX, y: rect.midY))
        path.addArc(center: CGPoint( x: rect.width/4,y: rect.height/4), radius: (rect.width/4), startAngle: Angle(radians: Double.pi), endAngle: Angle(radians: 0), clockwise: false)
        path.addArc(center: CGPoint( x: rect.width * 3/4,y: rect.height/4),
                            radius: (rect.width/4),
                            startAngle: Angle(radians: Double.pi),
                            endAngle: Angle(radians: 0),
                            clockwise: false)
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.height),
                         control1: CGPoint(x: rect.width, y: rect.midY),
                         control2: CGPoint(x: rect.midX, y: rect.height*3/4))
        return path
    }
    
}


