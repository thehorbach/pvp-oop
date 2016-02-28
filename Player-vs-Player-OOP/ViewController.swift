//
//  ViewController.swift
//  Player-vs-Player-OOP
//
//  Created by Vyacheslav Horbach on 28/02/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var orcImg: UIImageView!
    @IBOutlet weak var knightImg: UIImageView!
    
    @IBOutlet weak var orcAttackBtn: UIButton!
    @IBOutlet weak var knightAttackBtn: UIButton!
    
    @IBOutlet weak var orcAttackLbl: UILabel!
    @IBOutlet weak var knightAttackLbl: UILabel!
    
    @IBOutlet weak var gameInfoLbl: UILabel!
    
    @IBOutlet weak var pressMeRestartBtn: UIButton!
    
    
    var playerOne: Character!
    var playerTwo: Character!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
        
        
    }
 

    @IBAction func onOrcAttackBtnPressed(sender: AnyObject) {
        playerTwo.attemptAttack(playerOne.attackPwr)
        
        if !playerTwo.isAlive {
            showResults()
            
            gameInfoLbl.text = "\(playerOne.name) won!"
        } else {
            gameInfoLbl.text = "\(playerOne.name) attacked \(playerTwo.name) for \(playerOne.attackPwr) HP"
            
            disableAttackBtns()
        }
        
    }
    
    @IBAction func onKnightAttackBtnPressed(sender: AnyObject) {
        playerOne.attemptAttack(playerTwo.attackPwr)
        
        if !playerOne.isAlive {
            showResults()
            
            gameInfoLbl.text = "\(playerTwo.name) won!"
        } else {
        
            gameInfoLbl.text = "\(playerTwo.name) attacked \(playerOne.name) for \(playerTwo.attackPwr) HP"
        
            disableAttackBtns()
        }
        
        
    }

    @IBAction func onRestartBtnPressed(sender: AnyObject) {
        pressMeRestartBtn.hidden = true
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "startGame", userInfo: nil, repeats: false)
    }
    
    
    func startGame() {
        gameInfoLbl.text = "Let the games beginnnn!!!"
        pressMeRestartBtn.hidden = true
        
        playerOne = Orc(startingHp: 100, attackPwr: 20)
        playerTwo = Knight(startingHp: 100, attackPwr: 20)
        
        orcImg.hidden = false
        knightImg.hidden = false
        
        showAttackBtns()

    }
    
    func showResults() {
        orcImg.hidden = true
        knightImg.hidden = true
        
        hideAttackBtns()
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showRestartBtn", userInfo: nil, repeats: false)
        
        

    }
    
    func showRestartBtn() {
        pressMeRestartBtn.hidden = false
    }
    
    func hideAttackBtns() {
        orcAttackBtn.hidden = true
        knightAttackBtn.hidden = true
        
        orcAttackLbl.hidden = true
        knightAttackLbl.hidden = true
    }
    
    func showAttackBtns() {
        orcAttackBtn.hidden = false
        knightAttackBtn.hidden = false
        
        orcAttackLbl.hidden = false
        knightAttackLbl.hidden = false
    }
    
    func disableAttackBtns() {
        hideAttackBtns()
        
        NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: "showAttackBtns", userInfo: nil, repeats: false)
    }

}

