//
//  ViewController.swift
//  Pig Game
//
//  Created by Egbirika, Mabel C on 9/27/19.
//  Copyright © 2019 Egbirika, Mabel C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var turnLabel: UILabel!
    @IBOutlet var player1Label: UILabel!
    @IBOutlet var player2Label: UILabel!
    @IBOutlet var endOutlet: UIButton!
    @IBOutlet var diceImage: UIImageView!
    @IBOutlet var rollOutlet: UIButton!
    var player1Total = 0
    var player2Total = 0
    var player1RoundScore = 0
    var player2RoundScore = 0
    var player1turn = true;
    var rollNum: Int = 0
    @IBAction func endButton(_ sender: Any) {
        updatePlayer()
        player1RoundScore = 0
        player2RoundScore = 0
    }
    @IBAction func rolledButton(_ sender: Any) {
        
        rollNum = randomNum()
        switch rollNum {
        case 1:
            let dice1Image = UIImage(named: "dice1.png")
            diceImage.image = dice1Image;
        case 2:
            let dice2Image = UIImage(named: "dice2.png")
            diceImage.image = dice2Image;
        case 3:
            let dice3Image = UIImage(named: "dice3.png")
            diceImage.image = dice3Image;
        case 4:
            let dice4Image = UIImage(named: "dice4.png")
            diceImage.image = dice4Image;
        case 5:
            let dice5Image = UIImage(named: "dice5.png")
            diceImage.image = dice5Image;
        case 6:
            let dice6Image = UIImage(named: "dice6.png")
            diceImage.image = dice6Image;
        default:
            print("you screwed up")
        }
        if(rollNum == 1)
        {
            if(player1turn == true)
            {
                player1RoundScore = 0
                updatePlayer()
            }
            else
            {
                player2RoundScore = 0
                updatePlayer()
            }
        }
        else
        {
            if(player1turn == true)
            {
                player1RoundScore += rollNum
                roundLabel.text = String (player1RoundScore)
                
            }
            else
            {
                player2RoundScore += rollNum
                roundLabel.text = String (player2RoundScore)
                
            }
            }
        
    }
    
    func updatePlayer()
    {
        roundLabel.text = String (0)
        if(player1turn == true)
        {
            player1Total += player1RoundScore
            player1Label.text = String (player1Total)
        }
        else
        {
            player2Total += player2RoundScore
            player2Label.text = String (player2Total)
        }
        if(player1Total >= 100)
        {
            winnerLabel.text = "PLAYER 1 WINS!"
        }
        else if(player2Total >= 100)
        {
            winnerLabel.text = "PLAYER 2 WINS!"
        }
        player1turn.toggle()
        turnLabel.text = player1turn ? "It's Player One's Turn" : "It's Player Two's Turn"
    }
    @IBAction func restartButton(_ sender: Any) {
        player1Total = 0
        player2Total = 0
        player1RoundScore = 0
        player2RoundScore = 0
        player1turn = true
        player1Label.text = String (0)
        player2Label.text = String (0)
        roundLabel.text = String (0)
        turnLabel.text = "It's Player One's Turn"
        winnerLabel.text = ""
    }
    func randomNum() -> Int
    {
        let num = Int.random(in: 1...6)
        return num
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }



}

