//
//  Node_LinkingApp.swift
//  Shared
//
//  Created by Beau Nouvelle on 23/7/21.
//

import SwiftUI

@main
struct Node_LinkingApp: App {
    
    @StateObject var model = NodeModel()
    @StateObject var drawingManager = DrawingManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(drawingManager)
        }
    }
}
