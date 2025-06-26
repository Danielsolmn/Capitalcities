//
//  QuizViewController.swift
//  Trivia
//
//  Created by Daniel Woldetsadik on 6/25/25.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBAction func button2(_ sender: Any) {
        checking(1)
    }
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var remanining: UILabel!
    @IBAction func restartgame(_ sender: UIButton) {
        
        counting = 0
           score = 0

        Button1.isHidden = false 
       Button2.isHidden = false
        Button3.isHidden = false
        Button4.isHidden = false
        
          displayToUsers()}
    @IBOutlet weak var reset: UIButton!
    @IBAction func Button1(_ sender: UIButton) {
        checking(0)
    }
   
    @IBAction func Button3(_ sender: UIButton) {
    checking(2)
    }
    @IBAction func Button4(_ sender: UIButton) {
    checking(3)
    }
    let questions: [Question] = [
            Question(
                imageName: "ethiopia",
                text: "What is the capital city of Ethiopia?",
                answers: ["Nairobi", "Addis Ababa", "Cairo", "Lagos"],
                correctIndex: 1
            ),
            Question(
                imageName: "kenya",
                text: "What is the capital city of Kenya?",
                answers: ["Nairobi", "Cape Town", "Addis Ababa", "Accra"],
                correctIndex: 0
            ),
            Question(
                imageName: "denmark",
                text: "What is the capital city of Denmark?",
                answers: ["Stockholm", "Berlin", "Oslo", "Copenhagen"],
                correctIndex: 3
            ),
            Question(
                imageName: "nigeria",
                text: "What is the capital city of Nigeria?",
                answers: ["Abuja", "Lagos", "Accra", "Kano"],
                correctIndex: 0
            ),
            Question(
                imageName: "france",
                text: "What is the capital city of France?",
                answers: ["Rome", "Paris", "Madrid", "Berlin"],
                correctIndex: 1
            ),
            Question(
                imageName: "southafrica",
                text: "What is the capital city of South Africa?",
                answers: ["Pretoria", "Cape Town", "Durban", "Johannesburg"],
                correctIndex: 0
            ),
            Question(
                imageName: "japan",
                text: "What is the capital city of Japan?",
                answers: ["Beijing", "Seoul", "Tokyo", "Osaka"],
                correctIndex: 2
            ),
            Question(
                imageName: "canada",
                text: "What is the capital city of Canada?",
                answers: ["Toronto", "Ottawa", "Vancouver", "Montreal"],
                correctIndex: 1
            ),
            Question(
                imageName: "india",
                text: "What is the capital city of India?",
                answers: ["Mumbai", "New Delhi", "Chennai", "Kolkata"],
                correctIndex: 1
            ),
            Question(
                imageName: "brazil",
                text: "What is the capital city of Brazil?",
                answers: ["São Paulo", "Rio de Janeiro", "Brasília", "Salvador"],
                correctIndex: 2
            )
        ]
    

    
    var counting = 0
    var score=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bg = UIImageView(frame: UIScreen.main.bounds)
            bg.image = UIImage(named: "background2")
            bg.contentMode = .scaleAspectFill
            view.insertSubview(bg, at: 0)

            displayToUsers()
        displayToUsers()
    }
    
    func displayToUsers() {
        if counting < questions.count {
            let current = questions[counting]
            questionImageView.image = UIImage(named: current.imageName.lowercased())
            Label.text = current.text
            Button1.setTitle(current.answers[0], for: .normal)
            Button2.setTitle(current.answers[1], for: .normal)
            Button3.setTitle(current.answers[2], for: .normal)
            Button4.setTitle(current.answers[3], for: .normal)
            remanining.text = "Question \(counting + 1) of \(questions.count)" }
        else {
            remanining.text = "Game Over"
            Label.text = "Quiz done! You got \(score) out of \(questions.count) correct."
            Button1.isHidden = true
            Button2.isHidden = true
            Button3.isHidden = true
            Button4.isHidden = true
            reset.isHidden = false
            questionImageView.image = nil }  }
    
    func checking(_ selectedIndex: Int) {
        let current = questions[counting]
    let correct = current.correctIndex
    if selectedIndex == correct {
            Label.text = "Correct!"
                score += 1
            } else {
        Label.text = "Wrong!"
            }
        counting += 1
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.displayToUsers()
        }
        }
    }

