//
//  ViewController.swift
//  Skjenkestua priskalkulator
//
//  Created by Mathias Tollerud on 19.01.2017.
//  Copyright © 2017 Mathias Tollerud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var wholesaleOnScreen:Double = 0;
	var retailOnScreen:Double = 0;
	var theNumber:String = "";
    
    @IBOutlet weak var wholesale: UILabel!
    @IBOutlet weak var retail: UILabel!
	
	@IBOutlet weak var comma: UIButton!
    
    @IBAction func btnNumber(_ sender: UIButton) {
		if sender.tag < 12 {
        wholesale.text = wholesale.text! + String(sender.tag-1)
		}
        wholesaleOnScreen = Double(wholesale.text!)!
		
		//retail.text = retail.text! + String(Double(Int(Double(sender.tag-1) * 1.25)+1) * 1.25)
		let setPrice = Double(Double(Double(wholesale.text!)! * 1.25) + 1) * 1.25
		let roundPrice = Double(round(100*setPrice)/100)
		
		retail.text = String(roundPrice)
		//retail.text = retail.text! + String(sender.tag-1)

		retailOnScreen = Double(retail.text!)!
		
		if comma.isEnabled == false && !(wholesale.text?.contains("."))! {
			comma.isEnabled = true
		}
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        if sender.tag == 11 {
            wholesale.text = ""
            retail.text = ""
            wholesaleOnScreen = 0;
			retailOnScreen = 0;
			
			//comma.isEnabled = true
			//comma.backgroundColor = UIColor(red: 255.0/255.0, green: 47.0/47.0, blue: 146.0/146.0, alpha: 1.0)
        }
    }
	
	@IBAction func btnComma(_ sender: UIButton) {
		if sender.tag == 12 {
			theNumber = wholesale.text!
			if !theNumber.contains(".") {
				let setComma = wholesale.text! + String(".")
				wholesale.text = String(setComma)
				sender.isEnabled = false
				//sender.backgroundColor = UIColor.gray
			}
		}
	}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		comma.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

