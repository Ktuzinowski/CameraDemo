//
//  ImagePreviewViewController.swift
//  CameraDemo
//
//  Created by Kevin Tuzinowski on 3/26/22.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    @IBOutlet weak var capturedImageView: UIImageView!
    var capturedImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        capturedImageView.image = capturedImage!
    }

}
