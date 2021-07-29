//
//  DrawingManager.swift
//  Node-Linking
//
//  Created by Beau Nouvelle on 26/7/21.
//

import Foundation
import SwiftUI

final class DrawingManager: ObservableObject {
    
    @Published var activePathStart: CGPoint = .zero
    @Published var activePathCurrent: CGPoint = .zero
    @Published var isDrawing: Bool = false
    
}
