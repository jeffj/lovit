//
//  ViewController.swift
//  loveit
//
//  Created by jeff jenkins on 12/7/14.
//  Copyright (c) 2014 jeff jenkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelView: UILabel!
    
    @IBOutlet weak var textInput: UITextField!
    
    let context = String()
    
    @IBAction func applyStuff(sender: AnyObject) {
        labelView.text = textInput.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

