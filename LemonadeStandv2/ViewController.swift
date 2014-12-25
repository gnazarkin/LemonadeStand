//
//  ViewController.swift
//  LemonadeStandv2
//
//  Created by Gleb Nazarkin on 2014-12-25.
//  Copyright (c) 2014 Addo Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Variables
    
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    var price = Price()
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    var revenue = 0

    @IBOutlet weak var moneyLeftLabel: UILabel!
    @IBOutlet weak var lemonsLeftLabel: UILabel!
    @IBOutlet weak var iceCubesLeftLabel: UILabel!
    @IBOutlet weak var lemonsToPurchaseLabel: UILabel!
    @IBOutlet weak var iceCubesToPurchaseLabel: UILabel!
    @IBOutlet weak var lemonsToMixLabel: UILabel!
    @IBOutlet weak var iceCubesToMixLabel: UILabel!
    
    
    @IBAction func addLemonsToPurchaseButton(sender: UIButton) {
        
        if supplies.money >= price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough money")
        }
        
    }
    @IBAction func removeLemonsToPurchaseButton(sender: UIButton) {
        if supplies.lemons >= 1 {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough lemons")
        }
    }
    @IBAction func addIceCubesToPurchase(sender: UIButton) {
        if supplies.money >= price.iceCube {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough money")
        }
    }
    
    @IBAction func removeIceCubesToPurchaseButton(sender: UIButton) {
        if supplies.iceCubes >= 1 {
            iceCubesToPurchase -= 1
            supplies.money += price.iceCube
            supplies.iceCubes -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough ice cubes")
        }
    }
    
    @IBAction func addLemonsToMixButton(sender: UIButton) {
        if supplies.lemons >= 1 {
            lemonsToMix += 1
            lemonsToPurchase = 0
            supplies.lemons -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough lemons")
        }
    }
    @IBAction func removeLemonsToMixButton(sender: UIButton) {
        if lemonsToMix >= 1 {
            lemonsToMix -= 1
            lemonsToPurchase = 0
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "The mix doesn't have enough lemons to remove")
        }
    }
    
    @IBAction func addIceCubesToMixButton(sender: UIButton) {
        if supplies.iceCubes >= 1 {
            iceCubesToMix += 1
            iceCubesToPurchase = 0
            supplies.iceCubes -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough ice cubes")
        }
    }
    
    @IBAction func removeIceCubesToMixButton(sender: UIButton) {
        if iceCubesToMix >= 1 {
            iceCubesToMix -= 1
            iceCubesToPurchase = 0
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough ice cubes to remove")
        }
    }
    
    @IBAction func startDayButton(sender: UIButton) {
        let customers = Int(arc4random_uniform(UInt32(11)))
        
        if iceCubesToMix == 0 || lemonsToMix == 0 {
            showAlertWithText(message: "You don't have enough supplies to make lemonade")
        }
        else {
            let lemonadeRatio = Double(lemonsToMix)/Double(iceCubesToMix)
            
            for var i = 0; i <= customers; i++ {
                var customerPreference = Double(arc4random_uniform(UInt32(101)))/100
                
                if customerPreference < 0.4 && lemonadeRatio > 1 {
                    println("Customer \(i + 1) paid. Customer preference: \(customerPreference). Lemonade Ratio: \(lemonadeRatio)")
                    supplies.money += 1
                }
                else if customerPreference >= 0.4 && customerPreference < 0.6 && lemonadeRatio == 1 {
                    println("Customer \(i + 1) paid. Customer preference: \(customerPreference). Lemonade Ratio: \(lemonadeRatio)")
                    supplies.money += 1
                }
                else if customerPreference >= 0.6 && lemonadeRatio < 1 {
                    println("Customer \(i + 1) paid. Customer preference: \(customerPreference). Lemonade Ratio: \(lemonadeRatio)")
                    supplies.money += 1
                }
                else {
                    println("Customer \(i + 1) did not pay. Customer preference: \(customerPreference). Lemonade Ratio: \(lemonadeRatio)")
                }
            }
            
            lemonsToMix = 0
            iceCubesToMix = 0
            
            lemonsToPurchase = 0
            iceCubesToPurchase = 0
            
            updateMainView()
           
        }
        
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateMainView() {
        moneyLeftLabel.text = "$\(supplies.money)"
        lemonsLeftLabel.text = "\(supplies.lemons) Lemons"
        iceCubesLeftLabel.text = "\(supplies.iceCubes) Ice Cubes"
        
        lemonsToPurchaseLabel.text = "\(lemonsToPurchase)"
        iceCubesToPurchaseLabel.text = "\(iceCubesToPurchase)"
        
        lemonsToMixLabel.text = "\(lemonsToMix)"
        iceCubesToMixLabel.text = "\(iceCubesToMix)"
    }
    
    func showAlertWithText(header : String = "Warning", message : String) {
        var alert  = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


}

