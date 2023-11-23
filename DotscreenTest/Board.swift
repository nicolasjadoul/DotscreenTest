//
//  BoardGame.swift
//  DotscreenTest
//
//  Created by Jadoul Nicolas on 23/11/2023.
//

import SwiftUI

struct Board: View {
    let rows = 6
    let cols = 7
    @State var board = Array(repeating: Array(repeating: 0, count: 7), count: 6)
    @State var currentPlayer = 1
    @State var victoryDetected: Bool = false
    
    var body: some View {
        VStack {
            Text("Player : \(currentPlayer)")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.black)
                .padding()
            
            VStack(spacing: 0) {
                ForEach(0..<rows, id: \.self) { row in
                    HStack(spacing: 0)  {
                        ForEach(0..<cols, id: \.self) { col in
                            Button {
                                play(col: col, row: row)
                            } label: {
                                switch board[row][col] {
                                case 1:
                                    RedPiece()
                                case 2:
                                    YellowPiece()
                                default:
                                    EmptyPiece()
                                }
                            }
                            .disabled(victoryDetected ? true : false)
                        }
                    }
                }
            }
            .padding()
            Text("Player \(currentPlayer) win")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.black)
                .padding()
                .opacity(victoryDetected ? 1 : 0)
            Button {
                ResetGame()
            } label: {
                Text("Reset")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.black)
                    .padding()
                    .opacity(victoryDetected ? 1 : 0)
            }
            
        }
    }
    
    func play(col: Int, row: Int) {
            if (board[row][col] == 0) 
//                && ((board[row - 1][col] != 0) || (board[row - 1][col] == nil))
        {
                board[row][col] = currentPlayer
                switchPlayer()
                checkWin()
        }
    }
    
    func switchPlayer() {
        currentPlayer = (currentPlayer == 1) ? 2 : 1
    }
    
    func checkWin() {
        for row in 0..<rows {
            for col in 0..<cols {
                if board[row][col] != 0 {
                    if col + 3 < cols &&
                        board[row][col] == board[row][col + 1] &&
                        board[row][col] == board[row][col + 2] &&
                        board[row][col] == board[row][col + 3] {
                        switchPlayer()
                        victoryDetected.toggle()
                    }
                    
                    if row + 3 < rows &&
                        board[row][col] == board[row + 1][col] &&
                        board[row][col] == board[row + 2][col] &&
                        board[row][col] == board[row + 3][col] {
                        switchPlayer()
                        victoryDetected.toggle()
                    }
                    
                    if row + 3 < rows && col + 3 < cols &&
                        board[row][col] == board[row + 1][col + 1] &&
                        board[row][col] == board[row + 2][col + 2] &&
                        board[row][col] == board[row + 3][col + 3] {
                        switchPlayer()
                        victoryDetected.toggle()
                    }
                    
                    if row + 3 < rows && col - 3 >= 0 &&
                        board[row][col] == board[row + 1][col - 1] &&
                        board[row][col] == board[row + 2][col - 2] &&
                        board[row][col] == board[row + 3][col - 3] {
                        switchPlayer() 
                        victoryDetected.toggle()
                    }
                }
            }
        }
    }
    
    func ResetGame(){
        victoryDetected.toggle()
        for row in 0..<rows {
            for col in 0..<cols {
                board[row][col] = 0
            }
        }
    }
}


#Preview {
    Board()
}
