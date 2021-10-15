//: [Previous](@previous)


import Foundation
import PlaygroundSupport
import SpriteKit
import CoreGraphics




class Scene3 : SKScene {
    let backgroundScene3 = SKAudioNode(fileNamed: "Scene3Back")
    override func didMove(to view: SKView) {
        self.addChild(backgroundScene3)
        backgroundScene3.run(SKAction.play())
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in (touches) {
            let giveIt = childNode(withName: "GiveIt")
            let takeIt = childNode(withName: "TakeIt")
            let touchLocation = touch.location(in: self)

            if(giveIt!.contains(touchLocation)){
                backgroundScene3.removeFromParent()
                let sceneG = SceneGood(fileNamed: "Scene3 Good")
                sceneG?.scaleMode = .aspectFit
                sceneView.presentScene(sceneG)
                
            }
            if(takeIt!.contains(touchLocation)){
                backgroundScene3.removeFromParent()
                let sceneB = BadScene(fileNamed: "Scene3 Bad")
                sceneB?.scaleMode = .aspectFit
                sceneView.presentScene(sceneB)
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

class SceneGood : SKScene{
    let backgroundSceneGood = SKAudioNode(fileNamed: "Scene3Good")
    override func didMove(to view: SKView) {
        addChild(backgroundSceneGood)
        let wait = SKAction.wait(forDuration: 30)
        let fade = SKAction.changeVolume(to: 0, duration: 10)
        backgroundSceneGood.run(SKAction.play())
        backgroundSceneGood.run(SKAction.sequence([wait,fade]))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

class BadScene : SKScene{
    let backgroundSceneBad = SKAudioNode(fileNamed: "Scene3Bad")
    override func didMove(to view: SKView) {
        addChild(backgroundSceneBad)
        let wait = SKAction.wait(forDuration: 30)
        let fade = SKAction.changeVolume(to: 0, duration: 10)
        backgroundSceneBad.run(SKAction.play())
        backgroundSceneBad.run(SKAction.sequence([wait,fade]))
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



