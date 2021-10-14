import Foundation
import PlaygroundSupport
import SpriteKit
import CoreGraphics




class Scene3 : SKScene {
    override func didMove(to view: SKView) {
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = SceneGood(fileNamed: "Scene3 Good")
        scene?.scaleMode = .aspectFit
        sceneView.presentScene(scene)
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

class SceneGood : SKScene{
    override func didMove(to view: SKView) {
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1920, height: 1080))

if let scene = Scene3(fileNamed: "Scene3") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFit
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
