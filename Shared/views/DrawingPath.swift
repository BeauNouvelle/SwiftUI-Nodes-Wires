//
//  DrawingPath.swift
//  Node-Linking
//
//  Created by Beau Nouvelle on 26/7/21.
//

import Foundation
import SwiftUI

struct DrawingPath: View {
    @EnvironmentObject var manager: DrawingManager
    
    var body: some View {
        ZStack {
            if manager.isDrawing {
                Path { path in
                    path.move(to: manager.activePathStart)
                    path.addCurve(to: manager.activePathCurrent, control1: manager.activePathStart.applying(.init(translationX: 0, y: 40)), control2: manager.activePathCurrent.applying(.init(translationX: 0, y: 40)))
                }
                .strokedPath(.init(lineWidth: 4, lineCap: .round, lineJoin: .round, dash: [10], dashPhase: 5))
                .stroke(Color.primary)
            }
        }
    }

}
