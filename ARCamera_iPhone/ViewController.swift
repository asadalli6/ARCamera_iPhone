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

    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.add3DText(showText: "😊")
        
        sceneView.session.run(configuration)
    }
    
    
    @IBAction func updateEmoji(_ sender: Any) {
        let zCoords = randomFloat(min: -2, max: -0.2)
        let cube = SCNNode(geometry: SCNSphere(radius: 0.1))
        cube.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "emoji.png")
        cube.position = SCNVector3(0, 0, -0.3)
        sceneView.scene.rootNode.addChildNode(cube)
    }
        
    @IBAction func takeSnapshot(_ sender: Any) {
        
          UIImageWriteToSavedPhotosAlbum(self.sceneView.snapshot(), nil, nil, nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
         textField.resignFirstResponder()
         
         return true
     }
    
    func randomFloat(min: Float, max: Float) -> Float   {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
}

