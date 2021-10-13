import Foundation
import PlaygroundSupport
import SpriteKit
import CoreGraphics




class Scene1 : SKScene {
    override func didMove(to view: SKView) {
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1920, height: 1080))

if let scene = Scene1(fileNamed: "Scene1") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .resizeFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
