//
//  Menu.swift
//  MyApp
//
//  Created by Jia XiangCheng on 16/2/3.
//  Copyright © 2016年 Jia XiangCheng. All rights reserved.
//

import UIKit

class Menu: UIViewController {
    
    var calcul = ""
    var operacio = ""
    
    @IBAction func suma(sender: AnyObject) {
        calcul = "Suma"
        operacio = "Suma"
        performSegueWithIdentifier("salt", sender: nil)
    }
    @IBAction func resta(sender: AnyObject) {
        calcul = "Resta"
        operacio = "Resta"
        performSegueWithIdentifier("salt", sender: nil)
    }
    @IBAction func mult(sender: AnyObject) {
        calcul = "Multiplicació"
        operacio = "Multiplicacio"
        performSegueWithIdentifier("salt", sender: nil)
    }
    @IBAction func div(sender: AnyObject) {
        calcul = "Divisió"
        operacio = "Divisio"
        performSegueWithIdentifier("salt", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController: Teoria = segue.destinationViewController as! Teoria
        DestViewController.titol = calcul
        DestViewController.operacio = operacio
    }
    
    
}
