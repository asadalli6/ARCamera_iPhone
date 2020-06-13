//
//  AppDelegate.swift
//  ARCamera_iPhone
//
//  Created by Asad Alli on 6/7/20.
//  Copyright © 2020 Asad Alli. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

extension ARSCNView {
    
    func removeNodeByName(nodeName: String)  {
        self.scene.rootNode.enumerateChildNodes { (node, _) in
            if node.name == nodeName {
                node.removeFromParentNode()
            }
        }
    }
    
    
    func add3DText(showText: String, nodeName: String = "flyingText")  {
        let inText = showText.isEmpty ? "\u{1F603}" : showText
        let text = SCNText(string: inText, extrusionDepth: 0.9)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: randomMaterial())
        text.materials = [material]
        
        let node = SCNNode()
        let xpos = randomPosition(lowerBound: 0.1, upperBound: 0.1)
        let ypos = randomPosition(lowerBound: 0.1, upperBound: 0.1)
        node.position = SCNVector3(x: 0, y: 0 , z: -3)
        node.scale = SCNVector3(x: 0.5, y: 0.5, z: 0.5)
        node.geometry = text
        node.name = nodeName
        
        self.scene.rootNode.addChildNode(node)
        //self.allowsCameraControl = true
        self.automaticallyUpdatesLighting = true
    
    
    }
    
    
    func randomMaterial() -> String {
        let material_fileName = ["colorfull01",
                                 "colorfull01S",
                                 "colorfull02S",
                                 "colorfullS",
                                 "jean_dark_blue",
                                 "jean_dark_blue01",
                                 "jean_dark_blue02",
                                 "leather_pink",
                                 "leather_red",
                                 "leather01",
                                 "leather02",
                                 "stainless01",
                                 "wood01",
                                 "wood02",
                                 "plate"]
        let random: Int = Int(arc4random_uniform(UInt32(material_fileName.count)) + 0)
        return material_fileName[random]
    }
    
    func randomPosition ( lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    
    
}
