//
//  ViewController.swift
//  NetInfoTestApp
//
//  Created by Travasoni Giuseppe on 29/08/16.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let netInfo = NKNetInfo()
        print(netInfo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

