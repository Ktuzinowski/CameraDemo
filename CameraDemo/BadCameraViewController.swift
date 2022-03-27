//
//  BadCameraViewController.swift
//  CameraDemo
//
//  Created by Kevin Tuzinowski on 3/26/22.
//

import UIKit
import AVFoundation

class BadCameraViewController: UIViewController {
    let session = AVCaptureSession()
    var camera: AVCaptureDevice?
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    var cameraCaptureOutput: AVCapturePhotoOutput?
    
    func initializeCaptureSession() {
        session.sessionPreset = AVCaptureSession.Preset.high
        camera = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let cameraCaptureInput = try AVCaptureDeviceInput(device: camera!)
            cameraCaptureOutput = AVCapturePhotoOutput()
            session.addInput(cameraCaptureInput)
            session.addOutput(cameraCaptureOutput!)
        } catch {
            print(error.localizedDescription)
        }
        
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.frame = view.bounds
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
        
        session.startRunning()
    }
    
    func takePicture() {
        
        let settings = AVCapturePhotoSettings()
        settings.flashMode = .auto
        cameraCaptureOutput?.capturePhoto(with: settings, delegate: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCaptureSession()
    }
    
    func displayCapturedPhoto(capturedPhoto: UIImage) {
        let imagePreviewViewController = storyboard?.instantiateViewController(withIdentifier: "ImagePreviewViewController") as! ImagePreviewViewController
        imagePreviewViewController.capturedImage = capturedPhoto
        navigationController?.pushViewController(imagePreviewViewController, animated: true)
    }

    @IBAction func takePicture(_ sender: Any) {
        takePicture()
    }
}

extension BadCameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let unwrappedError = error {
            print(unwrappedError.localizedDescription)
        } else {
            let imageData = photo.fileDataRepresentation()
            if let gotImageData = imageData {
                if let finalImage = UIImage(data: gotImageData) {
                    displayCapturedPhoto(capturedPhoto: finalImage)
                }
            }
        }
    }
}
