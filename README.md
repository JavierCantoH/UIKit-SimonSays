# UIKit-SimonSays 🎮

Welcome to the UIKit-SimonSays repository! This repository contains a simple implementation of the classic Simon Says game using UIKit for iOS. 📱🎮🕹️

## Overview 📝

The UIKit-SimonSays project demonstrates how to build a simple game using UIKit for iOS. The game is a digital version of the classic Simon Says game, where the player must repeat a pattern of colors and sounds. The app includes a leaderboard that allows users to compete with each other for high scores. 🏆🌟🔊

The sample project includes the following features:

- A simple, intuitive user interface that is easy to use and navigate 📱👀
- A randomized sequence of colors and sounds that changes every round 🎨🎶
- The ability to track high scores and display them on a leaderboard 🏆🌟
- Sound effects that enhance the player's experience 🔊🎵

## Getting Started 🚀

To get started with the UIKit-SimonSays project, simply clone this repository and open the Xcode project file. You can then build and run the app in the iOS Simulator or on a physical iOS device. 🛠️📱

## Usage 🤖

To use the UIKit-SimonSays project in your own iOS app, simply copy the `SimonSays` folder into your project and add the necessary files to your Xcode project. You can then customize the appearance and behavior of the game using UIKit and Swift. 📝🎨

```swift
import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var colorButtons: [UIButton]!

  var gameManager = GameManager()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Set up the game
    gameManager.delegate = self
    gameManager.startGame()
  }

  @IBAction func colorButtonTapped(_ sender: UIButton) {
    // Handle button taps
    gameManager.handleButtonTap(sender)
  }

}

extension ViewController: GameManagerDelegate {

  func updateScore(_ score: Int) {
    // Update the score label
    scoreLabel.text = "Score: \(score)"
  }

  func updateRound(_ round: Int) {
    // Update the round label
    roundLabel.text = "Round: \(round)"
  }

  func gameOver() {
    // Handle game over
    let alert = UIAlertController(title: "Game Over", message: "You lost!", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }

}
```

Credits 🙌

The UIKit-SimonSays project was created by Javier Canto Hernández. The project was inspired by the Simon Says game and the Swift 4.2 and iOS 12 Development: Learn to Build Apps course on Udemy.

License 📜

The UIKit-SimonSays project is licensed under the MIT License. Feel free to use this code in your own projects, but please give credit to the original author.
