//
//  ViewController.swift
//  ObjectFunAR
//
//  Created by Maxim Mitin on 16.11.21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        
        let pyramid = SCNPyramid(width: 0.4, height: 0.4, length: 0.4)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green
        pyramid.materials = [material]
        sceneView.autoenablesDefaultLighting = true
        
        let pyramidNode = SCNNode()
        pyramidNode.geometry = pyramid
        pyramidNode.position = SCNVector3(0.0, 0.0, -1.0)
        
        let rotation = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 2)
        let repeatRotation = SCNAction.repeatForever(rotation)
        pyramidNode.runAction(repeatRotation)
        
        sceneView.scene.rootNode.addChildNode(pyramidNode)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
}
