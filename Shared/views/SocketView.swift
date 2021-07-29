//
//  SocketView.swift
//  Node-Linking
//
//  Created by Beau Nouvelle on 26/7/21.
//

import Foundation
import SwiftUI

struct SocketView: View {
    var body: some View {
        Circle()
            .stroke(style: .init(lineWidth: 4))
            .background(Circle().fill(.black))
            .frame(width: 30, height: 30)
    }
}
