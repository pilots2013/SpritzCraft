import Foundation
import PlaygroundSupport
import SpriteKit
import CoreGraphics

var man = Character("Prince")
var woman = Character("Princess")


class IntroScene : SKScene {
    override func didMove(to view: SKView) {
       
        let background = SKSpriteNode(imageNamed:"Forest")
        background.zPosition = 1
        background.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
        man.position(x: Float(background.size.width)/2, y: -200)
        woman.position(x: -Float(background.size.width)/2, y: -200)
        addChild(man.character)
        addChild(woman.character)
        man.walk(x: -500, y: 0, duration: 6)
        woman.walk(x: 500, y: 0, duration: 6)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 800, height: 600))

if let scene = IntroScene(fileNamed: "IntroScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .resizeFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView


