//
//  PlayButton.swift
//  DotscreenTest
//
//  Created by Jadoul Nicolas on 23/11/2023.
//

import SwiftUI

struct PlayButton: View {
    var body: some View {
        Circle()
            .stroke(.black, lineWidth: 2)
            .frame(width: 42, height: 42)
    }
}

#Preview {
    PlayButton()
}
