import Foundation
import PlaygroundSupport
import SpriteKit
import CoreGraphics




class IntroScene : SKScene {
    override func didMove(to view: SKView) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene1 = Scene1(fileNamed: "Scene1")
        scene1?.scaleMode = .aspectFit
        sceneView.presentScene(scene1)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

class Scene1 : SKScene {
    override func didMove(to view: SKView) {
       
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


