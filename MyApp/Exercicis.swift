//
//  Exercicis.swift
//  MyApp
//
//  Created by Jia XiangCheng on 16/2/3.
//  Copyright © 2016年 Jia XiangCheng. All rights reserved.
//

import UIKit

class Exercicis: UIViewController {

    @IBOutlet weak var times: UISlider!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var firstnum: UILabel!
    @IBOutlet weak var secondnum: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var coment: UILabel!
    @IBOutlet weak var nextex: UIButton!
    
    var random1 = arc4random_uniform(10)
    var random2 = arc4random_uniform(10)
    
    var tipudeop2 = String()
    
    //timer
    var tempsrestant = 0
    var timer = NSTimer()
    
    //introduir introduir
    var num = String()
    var aux = ""
    var istyping = true
    
    @IBAction func next(sender: AnyObject) {
        random1 = arc4random_uniform(10)
        random2 = arc4random_uniform(10)
        firstnum.text = String(random1)
        secondnum.text = String(random2)
        result.text = ""
        tempsrestant = -1
        coment.text = ""
        nextex.enabled = false
        
        if (operation.text == "÷") {
            if (Int(secondnum.text!)! >= Int(firstnum.text!)!) {
                
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
        if (operation.text == "x") {
            let resultat = Int(firstnum.text!)! * Int(secondnum.text!)!
            if (Int(result.text!)! == resultat) {
                coment.text = "Answer Correct ! :D"
            }
            else {
                coment.text = "Wrong Answer! :("
            }
        }
        else {
            let resultat = Int(firstnum.text!)! / Int(secondnum.text!)!
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
        
        if (tipudeop2 == "Multiplicacio") {
            operation.text = "x"
        }
        if (tipudeop2 == "Divisio") {
            operation.text = "÷"
        }
        
        firstnum.text = String(random1)
        secondnum.text = String(random2)
        
        if (operation.text == "÷") {
            if (Int(secondnum.text!)! >= Int(firstnum.text!)!) {
            }
        }
        
        nextex.enabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func temps() {
        tempsrestant++
        times.enabled = false
        times.value = Float(tempsrestant)
    }

  

}
