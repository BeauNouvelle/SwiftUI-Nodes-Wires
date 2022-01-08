//
//  Node.swift
//  Node-Linking
//
//  Created by Beau Nouvelle on 23/7/21.
//

import Foundation
import SwiftUI

final class NodeModel: ObservableObject {
    @Published var nodes: [Node] = []
    @Published var wires: [Wire] = []
}

final class Node: Identifiable {
    var id = UUID()
    var position: CGPoint = .zero
    var sockets: [Socket] = [Socket(), Socket()]
}

final class Socket: Identifiable {
    var id = UUID()
    var position: CGPoint = .zero
}

final class Wire: Identifiable {
    
    var id = UUID()
    
    var startSocket: Socket
    var endSocket: Socket
    
    init(startSocket: Socket, endSocket: Socket) {
        self.startSocket = startSocket
        self.endSocket = endSocket
    }
}
