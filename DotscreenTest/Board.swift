//
//  BoardGame.swift
//  DotscreenTest
//
//  Created by Jadoul Nicolas on 23/11/2023.
//

import SwiftUI

struct BoardGame: View {
    let rows = 6
    let cols = 7
    @State var board = Array(repeating: Array(repeating: 0, count: 7), count: 6)
    
    @State var currentPlayer = 1
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 0)  {
                    ForEach(0..<cols, id: \.self) { col in
                        Button {
                            dropPiece(column: col)
                        } label: {
                            switch board[row][col] {
                            case 0:
                                EmptyPiece()
                            case 1:
                                RedPiece()
                            case 2:
                                YellowPiece()
                            default:
                                EmptyView()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func dropPiece(column: Int) {
        for row in (0..<rows).reversed() {
            if board[row][column] == 0 {
                board[row][column] = currentPlayer
                switchPlayer()
                return
            }
        }
    }
    
    func switchPlayer() {
        currentPlayer = (currentPlayer == 1) ? 2 : 1
    }
}

#Preview {
    BoardGame()
}
