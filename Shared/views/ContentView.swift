//
//  ContentView.swift
//  Shared
//
//  Created by Beau Nouvelle on 23/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: NodeModel

    var body: some View {
        ZStack {
            ForEach(model.nodes) { node in
                NodeView(node: node)
            }
            ForEach(model.wires) { wire in
                Path { path in
                    path.move(to: wire.startSocket.position)
                    path.addCurve(to: wire.endSocket.position,
                                  control1: wire.startSocket.position.applying(CGAffineTransform(translationX: 0, y: 40)),
                                  control2: wire.endSocket.position.applying(CGAffineTransform(translationX: 0, y: 40)))
                }
                .strokedPath(.init(lineWidth: 4, lineCap: .round, dash: [5], dashPhase: 10))
            }
            DrawingPath()
        }
        .frame(minWidth: 600, minHeight: 300)
        .toolbar {
            Button {
                model.nodes.append(Node())
            } label: {
                Text("New Node")
            }
        }
        .coordinateSpace(name: "Canvas")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
