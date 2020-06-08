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

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
    }
    
    func randomFloat(min: Float, max: Float)    -> Float{
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    @IBAction func addCube(_ sender: Any) {
    
        let cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        
        let cc = getCameraCoordinates(sceneView: sceneView)
        cubeNode.position = SCNVector3(x: cc.x,y: cc.y, z: cc.z)
        
        sceneView.scene.rootNode.addChildNode(cubeNode)
    }
    
    
    @IBAction func takeSnapshot(_ sender: Any) {
        
          UIImageWriteToSavedPhotosAlbum(self.sceneView.snapshot(), nil, nil, nil)
    }
    
    struct myCameraCoordiantes  {
             var x = Float()
             var y = Float()
             var z = Float()
         }
    
    func getCameraCoordinates(sceneView: ARSCNView) -> myCameraCoordiantes  {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        
        var cc = myCameraCoordiantes()
        
        cc.z = cameraCoordinates.translation.z
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        
        return cc
    }
    
}

