//
//  ViewController.swift
//  ARCamera_iPhone
//
//  Created by Asad Alli on 6/7/20.
//  Copyright © 2020 Asad Alli. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
    }
    
    @IBAction func insertEmoji(_ sender: UIButton) {
        let zCoords = randomFloat(min: -2, max: -0.2)
        let cube = SCNNode(geometry: SCNSphere(radius: 0.2))
        cube.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "emoji.png")
        cube.position = SCNVector3(0, 0, -1.0)
        sceneView.scene.rootNode.addChildNode(cube)
    }
    
        
    
    @IBAction func takePhoto(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(self.sceneView.snapshot(), nil, nil, nil)
    }
    
    func randomFloat(min: Float, max: Float) -> Float   {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
}

