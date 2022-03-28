//
//  GoodCameraViewController.swift
//  CameraDemo
//
//  Created by Kevin Tuzinowski on 3/26/22.
//

import UIKit
import CameraManager
import AVFoundation

class GoodCameraViewController: UIViewController {
    let cameraManager = CameraManager()
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCamera()
    }
    
    func initializeCamera() {
        cameraManager.addPreviewLayerToView(self.view)
    }

    @IBAction func takeAPicture(_ sender: UIButton) {
        cameraManager.capturePictureWithCompletion({ result in
            switch result {
            case .failure:
                print("there was a failure in capturing the image")
                    // error handling
            case .success(let content):
                self.displayCapturedPhoto(capturedPhoto: content.asImage!)
            }
        })
    }
    
    func displayCapturedPhoto(capturedPhoto: UIImage) {
        let imagePreviewViewController = storyboard?.instantiateViewController(withIdentifier: "ImagePreviewViewController") as! ImagePreviewViewController
        imagePreviewViewController.capturedImage = capturedPhoto
        navigationController?.pushViewController(imagePreviewViewController, animated: true)
    }
}
