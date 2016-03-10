//
//  ViewController.swift
//  MCPagingIntroViewController
//
//  Created by Mohonish Chakraborty on 03/10/2016.
//  Copyright (c) 2016 Mohonish Chakraborty. All rights reserved.
//

import UIKit
import MCPagingIntroViewController

class ViewController: MCPagingIntroViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.contentView.backgroundColor = UIColor.yellowColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

