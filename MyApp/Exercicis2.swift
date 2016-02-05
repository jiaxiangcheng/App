//
//  Exercicis2.swift
//  MyApp
//
//  Created by Jia XiangCheng on 4/2/16.
//  Copyright © 2016 Jia XiangCheng. All rights reserved.
//

import UIKit

class Exercicis2: UIViewController {
    
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var firstnum: UILabel!
    @IBOutlet weak var secondnum: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var time: UISlider!
    @IBOutlet weak var coment: UILabel!
    @IBOutlet weak var nextex: UIButton!
    
    var random1 = arc4random_uniform(100)
    var random2 = arc4random_uniform(100)
    
    var tipudeop = String()
    
    //timer
    var tempsrestant = 0
    var timer = NSTimer()
    
    //introduir introduir
    var num = String()
    var aux = ""
    var istyping = true
    
    @IBAction func next(sender: AnyObject) {
        random1 = arc4random_uniform(100)
        random2 = arc4random_uniform(100)
        firstnum.text = String(random1)
        secondnum.text = String(random2)
        result.text = ""
        tempsrestant = -1
        coment.text = ""
        nextex.enabled = false
        
        if (operation.text == "-") {
            if (Int(secondnum.text!)! >= Int(firstnum.text!)!) {
                var temp = String()
                temp = secondnum.text!
                secondnum.text = firstnum.text
                firstnum.text = temp
            }
        }
    }

    @IBAction func operation(sender: AnyObject) {
        let number = sender.currentTitle
        result.text = result.text! + number!!
        aux = sender.currentTitle!!
    }

    @IBAction func sup(sender: AnyObject) {
        result.text = ""
    }
    
    @IBAction func done(sender: AnyObject) {
        if (operation.text == "+") {
            let resultat = Int(firstnum.text!)! + Int(secondnum.text!)!
                if (Int(result.text!)! == resultat) {
                    coment.text = "Answer Correct ! :D"
                }
                else {
                    coment.text = "Wrong Answer! :("
            }
        }
        else {
            let resultat = Int(firstnum.text!)! - Int(secondnum.text!)!
            if (Int(result.text!)! == resultat) {
                coment.text = "Answer Correct ! :D"
            }
            else {
                coment.text = "Wrong Answer! :("
            }
        }
        nextex.enabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "temps", userInfo: nil, repeats: true)
        if (tipudeop == "Suma") {
            operation.text = "+"
        }
        if (tipudeop == "Resta") {
            operation.text = "-"
        }
    
        firstnum.text = String(random1)
        secondnum.text = String(random2)
        
        if (operation.text == "-") {
            if (Int(secondnum.text!)! >= Int(firstnum.text!)!) {
                var temp = String()
                temp = secondnum.text!
                secondnum.text = firstnum.text
                firstnum.text = temp
            }
        }
        
        nextex.enabled = false
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func temps() {
        tempsrestant++
        if (tempsrestant == 30) {
            let alert = UIAlertController(title: "Oops!", message:"You could answer this question :( ", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default) { _ in
                //accio que fas despres de clicar el OK
                self.random1 = arc4random_uniform(100)
                self.random2 = arc4random_uniform(100)
                self.firstnum.text = String(self.random1)
                self.secondnum.text = String(self.random2)
                self.result.text = ""
                self.tempsrestant = -1
                self.coment.text = ""
                self.nextex.enabled = false
                if (self.operation.text == "-") {
                    if (Int(self.secondnum.text!)! >= Int(self.firstnum.text!)!) {
                        var temp = String()
                        temp = self.secondnum.text!
                        self.secondnum.text = self.firstnum.text
                        self.firstnum.text = temp
                    }
                }
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true){}
        }
        
        time.enabled = false
        time.value = Float(tempsrestant)
    }
}
