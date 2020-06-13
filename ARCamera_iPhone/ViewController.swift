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
        
        sceneView.add3DText(showText: "\u{1F603}")
        
        sceneView.session.run(configuration)
    }
    
    
    @IBAction func updateEmoji(_ sender: Any) {
        sceneView.removeNodeByName(nodeName: "flyingText")
        sceneView.add3DText(showText: self.inputText!.text!, nodeName: "flyingText")
    }
        
    @IBAction func takeSnapshot(_ sender: Any) {
        
          UIImageWriteToSavedPhotosAlbum(self.sceneView.snapshot(), nil, nil, nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
         textField.resignFirstResponder()
         
         return true
     }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
}

