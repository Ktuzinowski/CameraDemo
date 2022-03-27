//
//  ViewController.swift
//  CameraDemo
//
//  Created by Kevin Tuzinowski on 3/26/22.
//

import UIKit
import CameraManager
import AVFoundation

class ViewController: UIViewController {
    @IBAction func badCameraTapped(_ sender: UIButton) {
        print("badCamera tapped")
    }
    
    @IBAction func goodCameraTapped(_ sender: UIButton) {
        print("goodCamera tapped")
    }
    @IBOutlet weak var badCamera: UIImageView!
    @IBOutlet weak var goodCamera: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

}

