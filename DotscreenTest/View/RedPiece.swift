//
//  SwiftUIView.swift
//  DotscreenTest
//
//  Created by Jadoul Nicolas on 23/11/2023.
//

import SwiftUI

struct RedPiece: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 50, height: 50)
            Circle()
                .fill(.red)
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    RedPiece()
}
