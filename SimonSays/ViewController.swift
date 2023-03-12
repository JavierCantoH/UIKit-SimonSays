//
//  ViewController.swift
//  SimonSays
//
//  Created by Luis Javier Canto Hurtado on 12/05/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var userTurn = false
    var array = [Int]()
    var count = 0
    var audioPlayer = AVAudioPlayer()
    
    let redSound = Bundle.main.path(forResource: "red", ofType: "mp3")
    let blueSound = Bundle.main.path(forResource: "blue", ofType: "mp3")
    let yellowSound = Bundle.main.path(forResource: "yellow", ofType: "mp3")
    let greenSound = Bundle.main.path(forResource: "green", ofType: "mp3")
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var red: UILabel!
    @IBOutlet weak var blue: UILabel!
    @IBOutlet weak var yellow: UILabel!
    @IBOutlet weak var green: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startGame(_ sender: Any) {
        count = 0
        array.removeAll()
        label.text = "Current score: 0"
        getNext()
    }
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        if userTurn && count < array.count {
                    var number = 0
                    let selectedLabel = sender.view as! UILabel
                    if selectedLabel == blue {
                        number = 1
                    } else if selectedLabel == yellow {
                        number = 2
                    } else if selectedLabel == green {
                        number = 3
                    }
                    flashAndPlaySound(number: number)
                    if number != array[count] {
                        label.text = "YOU LOST!"
                        userTurn = false
                    }
                    else {
                        count = count + 1
                        label.text = "Curren score: " + String(count)
                        if count == array.count {
                            count = 0
                            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getNext), userInfo: nil, repeats: false)
                        }
                    }
                }
    }
    
    
    func flashAndPlaySound(number: Int) {
           var url: URL!
           switch(number) {
           case 0: UIView.animate(withDuration: 1, delay: 0) {
                   self.red.alpha = 0.5
                   self.red.alpha = 1
               }
               url = URL(fileURLWithPath: redSound!)
               break
           case 1: UIView.animate(withDuration: 1, delay: 0) {
                   self.blue.alpha = 0.5
                   self.blue.alpha = 1
               }
               url = URL(fileURLWithPath: blueSound!)
               break
           case 2: UIView.animate(withDuration: 1, delay: 0) {
                   self.yellow.alpha = 0.5
                   self.yellow.alpha = 1
               }
               url = URL(fileURLWithPath: yellowSound!)
               break
           default: UIView.animate(withDuration: 1, delay: 0) {
                   self.green.alpha = 0.5
                   self.green.alpha = 1
               }
               url = URL(fileURLWithPath: greenSound!)
               break
           }
           do {
               audioPlayer = try AVAudioPlayer(contentsOf: url)
               audioPlayer.play()
           } catch {
               print("Error: Couldn't play sound")
           }
       }
    
    func playAll() -> Void {
            var delay = 0
            for number in array {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
                    self.flashAndPlaySound(number: number)
                }
                delay = delay + 1
            }
        }
    
    @objc func getNext() -> Void {
            userTurn = false
            let next = Int(arc4random_uniform(4))
            array.append(next)
            playAll()
            userTurn = true
        }
    
}

