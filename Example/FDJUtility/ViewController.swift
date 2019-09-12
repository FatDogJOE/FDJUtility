//
//  ViewController.swift
//  FDJUtility
//
//  Created by Joe on 07/25/2019.
//  Copyright (c) 2019 Joe. All rights reserved.
//

import UIKit
import SnapKit
import FDJUtility

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let str = "123456"
        
        let md5Data = str.md5Data()
        
        let bytes = md5Data.getBytes()
        let hex = md5Data.getHex()
        
//        let md5Str = str.md5()
//        let sha1Str = str.sha1()
//        let sha256Str = str.sha256()
//        let sha512Str = str.sha512()
        
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

