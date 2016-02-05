//
//  Sumateoria.swift
//  MyApp
//
//  Created by Jia XiangCheng on 16/2/3.
//  Copyright © 2016年 Jia XiangCheng. All rights reserved.
//

import UIKit

class Teoria: UIViewController {
    
    var titol = String()
    var operacio = ""
    
    @IBOutlet weak var navibar: UINavigationBar!
    @IBAction func ferexcicis(sender: AnyObject) {
        if (operacio == "Suma" || operacio == "Resta") {
            performSegueWithIdentifier("sumairesta", sender: nil)
        }
        if (operacio == "Multiplicacio" || operacio == "Divisio") {
            performSegueWithIdentifier("multiplicacio", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titol
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //no sempre entrem a Exercicis2, quan cliquem a Mul o Div anem a Exercicis per tant no podem assegurar que sempre podem accedir a Exercicis2 per tant fem un if i un else en el cas de que no podem anar
        if let DestViewController: Exercicis2 = segue.destinationViewController as? Exercicis2 {
            if (self.title == "Suma") {
                DestViewController.tipudeop = "Suma"
            }
            if (self.title == "Resta") {
                DestViewController.tipudeop = "Resta"
            }
        } else if let DestViewController: Exercicis = segue.destinationViewController as? Exercicis {
            
            if (self.title == "Multiplicació") {
                DestViewController.tipudeop2 = "Multiplicacio"
            }
            if (self.title == "Divisió") {
                DestViewController.tipudeop2 = "Divisio"
            }
        }
        
        
    }
}