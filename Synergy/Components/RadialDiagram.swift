//
//  RadialDiagram.swift
//  Synergy
//
//  Created by Артур Кулик on 08.12.2023.
//

import SwiftUI

struct RadialDiagram: View {
    
    private let foregroundColor = Theme.Socionics.Colors.secondaryText
    
    private var numberOfCircles: Int = 4
    private var numberOfLines: Int = 4
    
    private let minDiameter: CGFloat = 100
    private let circleDiff: CGFloat = 30
    private let lineWidth: CGFloat = 2
    private let ballDiameter: CGFloat = 10
    
    
    private var lineDegree: Double {
        360 / Double(numberOfLines * 2)
    }
    
    private var maxDiameter: CGFloat {
        minDiameter + (CGFloat(numberOfCircles - 1) * circleDiff)
    }
    
    var body: some View {
        content
    }
    
    init(functions: [SocionicsFunction.Name]) {
        self.functionArray = functions
    }
    
    var functionArray: [SocionicsFunction.Name]
    
    var content: some View {
        ZStack {
            circles
            lines
            Circle()
                .frame(height: minDiameter - lineWidth)
                .foregroundStyle(.white)
            balls(function: functionArray)
        }
    }
    
    var circles: some View {
        ZStack {
            ForEach(0..<numberOfCircles, id: \.self) { index in
                Circle()
                    .stroke(lineWidth: lineWidth)
                    .foregroundStyle(foregroundColor)
                    .frame(
                        height: minDiameter + CGFloat(index) * circleDiff
                    )
            }
        }
    }
    
    private var lines: some View {
        ZStack {
            ForEach(0...numberOfLines, id: \.self) { index in
                line
                    .rotationEffect(.degrees(Double(index) * lineDegree))
            }
        }
    }
    
    private var line: some View {
        Rectangle()
            .foregroundStyle(foregroundColor)
            .frame(width: lineWidth, height: maxDiameter)
    }
    
    var radius: Double {
        Double(maxDiameter) / 2
    }

    private func balls(function: [SocionicsFunction.Name]) -> some View {
        ZStack {
            ForEach(0..<numberOfCircles, id: \.self) { index in
                Circle()
                    .frame(width: ballDiameter)
                    .foregroundStyle(Theme.Socionics.Colors.red)
                    .offset(x: 0, y: (maxDiameter / 2) - (CGFloat(index) * (circleDiff / 2)))
                    .rotationEffect(
                        Angle(degrees: 180 + ballAngle(f: function[index]))
                    )
            }
        }
    }
    
    func ballAngle(f: SocionicsFunction.Name) -> Double {
        switch f {
        case .whiteLogic:
            lineDegree * 6
        case .whiteIntuition:
            lineDegree * 3
        case .whiteEthics:
            lineDegree * 4
        case .whiteSensorics:
            lineDegree * 5
        case .blackLogic:
            lineDegree * 0
        case .blackIntuition:
            lineDegree * 1
        case .blackEthics:
            lineDegree * 2
        case .blackSensorics:
            lineDegree * 7
        }
    }
}

#Preview {
    RadialDiagram(functions: [.whiteLogic, .blackIntuition, .whiteEthics, .blackSensorics])
}
