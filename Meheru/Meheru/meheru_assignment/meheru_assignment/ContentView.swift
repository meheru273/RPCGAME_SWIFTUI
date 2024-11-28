import SwiftUI

struct ContentView: View {
    
    @State private var runnerPosition: CGFloat = 0
    @State private var score: Int = 0
    @State private var gameOver: Bool = false
    @State private var runnerSpeed: CGFloat = 5.0
    
    var body: some View {
        ZStack {
            // Background Color
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            // The runner (character) - represented by a rectangle for simplicity
            Rectangle()
                .fill(Color.green)
                .frame(width: 50, height: 50)
                .position(x: runnerPosition, y: 300) // Move the runner position based on user input
            
            // Display the score
            VStack {
                Text("Score: \(score)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                
                Spacer()
                
                // Game Over message
                if gameOver {
                    Text("Game Over!")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .padding()
                    
                    Button(action: resetGame) {
                        Text("Restart")
                            .font(.title)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 50)
                }
            }
            
            // Tap to move the runner and increase score
            .onTapGesture {
                if !gameOver {
                    moveRunner()
                }
            }
        }
    }
    
    // Function to move the runner and update score
    func moveRunner() {
        if runnerPosition < UIScreen.main.bounds.width - 50 {
            runnerPosition += runnerSpeed
            score += 1
        } else {
            gameOver = true
        }
    }
    
    // Reset the game
    func resetGame() {
        runnerPosition = 0
        score = 0
        gameOver = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
