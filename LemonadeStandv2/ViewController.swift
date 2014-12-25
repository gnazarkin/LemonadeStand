//
//  ViewController.swift
//  LemonadeStandv2
//
//  Created by Gleb Nazarkin on 2014-12-25.
//  Copyright (c) 2014 Addo Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneyLeftLabel: UILabel!
    @IBOutlet weak var lemonsLeftLabel: UILabel!
    @IBOutlet weak var iceCubesLeftLabel: UILabel!
    @IBOutlet weak var lemonsToPurchaseLabel: UILabel!
    @IBOutlet weak var iceCubesToPurchaseLabel: UILabel!
    @IBOutlet weak var lemonsToMixLabel: UILabel!
    @IBOutlet weak var iceCubesToMixLabel: UILabel!
    
    
    @IBAction func addLemonsToPurchaseButton(sender: UIButton) {
    }
    @IBAction func removeLemonsToPurchaseButton(sender: UIButton) {
    }
    @IBAction func addIceCubesToPurchase(sender: UIButton) {
    }
    
        @IBAction func removeIceCubesToPurchaseButton(sender: UIButton) {
    }
    @IBAction func addLemonsToMixButton(sender: UIButton) {
    }
    @IBAction func removeLemonsToMixButton(sender: UIButton) {
    }
    @IBAction func addIceCubesToMixButton(sender: UIButton) {
    }
    @IBAction func removeIceCubesToMixButton(sender: UIButton) {
    }
    
    @IBAction func startDayButton(sender: UIButton) {
    }
    
    // Variables
    
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    var price = Price()
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
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

