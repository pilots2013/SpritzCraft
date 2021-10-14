import Foundation
import PlaygroundSupport
import SpriteKit
import CoreGraphics




class IntroScene : SKScene {
    override func didMove(to view: SKView) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1920, height: 1080))

if let scene = IntroScene(fileNamed: "IntroScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFit
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView


