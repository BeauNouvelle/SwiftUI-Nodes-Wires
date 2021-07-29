//
//  NodeView.swift
//  Node-Linking
//
//  Created by Beau Nouvelle on 26/7/21.
//

import Foundation
import SwiftUI

struct NodeView: View {
    
    @StateObject var node: Node
    @EnvironmentObject var model: NodeModel
    @EnvironmentObject var drawingManager: DrawingManager
    
    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    @GestureState private var fingerLocation: CGPoint? = nil
    @GestureState private var startLocation: CGPoint? = nil // 1

    var body: some View {
        VStack {
            HStack {
                Text("Node")
            }
            socketViews
        }
        .background(.cyan)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.white)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .position(location)
        .gesture(
            DragGesture()
                .onChanged { gesture in
            var newLocation = startLocation ?? location
            newLocation.x += gesture.translation.width
            newLocation.y += gesture.translation.height
            self.location = newLocation
            node.position = newLocation
        }
                .updating($startLocation) { (value, startLocation, transaction) in
            startLocation = startLocation ?? location
        })
        .coordinateSpace(name: "Node")
    }
    
    var socketViews: some View {
        HStack {
            ForEach(node.sockets) { socket in
                GeometryReader { reader in
                    SocketView()
                    // this is the location I need to send back along with the size of the sockets! A frame...
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .named("Node"))
                        .onChanged { gesture in
                            drawingManager.isDrawing = true
                            drawingManager.activePathStart = socket.position
                            drawingManager.activePathCurrent = gesture.location
                        }
                        .onEnded { gesture in
                            // when ended, check location is over another socket.
                            let gestureRect = CGRect(x: gesture.location.x-15, y: gesture.location.y-15, width: 30, height: 30)
                            for endSocket in model.nodes.flatMap ({ $0.sockets }) {
                                if gestureRect.contains(endSocket.position) {
                                    model.wires.append(Wire(startSocket: socket, endSocket: endSocket))
                                    break
                                }
                            }
                            drawingManager.isDrawing = false
                        })
                        .onChange(of: reader.frame(in: .named("Node")).origin) { newValue in
                            socket.position = CGPoint(x: newValue.x + 15, y: newValue.y + 15)
                            model.wires = model.wires
                        }
                        .onAppear {
                            socket.position = CGPoint(x: reader.frame(in: .named("Node")).midX, y: reader.frame(in: .named("Node")).midY)
                        }
                }
                .frame(width: 30, height: 30)
                .padding()
            }
        }
    }
    
}
