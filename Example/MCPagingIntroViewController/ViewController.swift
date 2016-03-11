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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MCPaginIntroViewController Customization overrides
    
    override func backgroundImages() -> [UIImage]? {
        let img1 = UIImage(named: "stockImage1.jpg")!
        let img2 = UIImage(named: "stockImage2.jpg")!
        return [img1, img2]
    }
    
    override func labelTexts() -> [String]? {
        return [
            "This is the first page",
            "Here comes the second page"
        ]
    }
    
    override func detailImages() -> [UIImage]? {
        let img1 = UIImage(named: "stockImage1.jpg")!
        let img2 = UIImage(named: "stockImage2.jpg")!
        return [img1, img2]
    }

}

