//
//  Node.swift
//  Node-Linking
//
//  Created by Beau Nouvelle on 23/7/21.
//

import Foundation
import SwiftUI

final class NodeModel: ObservableObject {
    @Published var nodes: [Node] = [Node(), Node()]
    @Published var wires: [Wire] = []
}

final class Node: ObservableObject, Identifiable {
    var id = UUID()
    @Published var position: CGPoint = .zero
    @Published var sockets: [Socket] = [Socket(), Socket()]
}

final class Socket: ObservableObject, Identifiable {
    var id = UUID()
    @Published var position: CGPoint = .zero
}

final class Wire: ObservableObject, Identifiable {
    
    var id = UUID()
    
    @Published var startSocket: Socket
    @Published var endSocket: Socket
    
    init(startSocket: Socket, endSocket: Socket) {
        self.startSocket = startSocket
        self.endSocket = endSocket
    }
}
