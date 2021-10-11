import Foundation
import PlaygroundSupport
import SpriteKit

var man : SKSpriteNode!
var woman : SKSpriteNode!

class IntroScene : SKScene {
    override func didMove(to view: SKView) {
        var texture:[SKTexture] = []
        texture.append(SKTexture(imageNamed: "PrinceMove1"))
        texture.append(SKTexture(imageNamed: "PrinceMove2"))
        let walkAnimation = SKAction.animate(with: texture, timePerFrame: 0.2)
        let moveR = SKAction.moveBy(x: -600, y: 0, duration: 5)
        let background = SKSpriteNode(imageNamed:"Forest")
        background.zPosition = 1
        background.position = CGPoint(x:0, y: 300)
        background.size.width = self.size.width
        background.size.height = self.size.height
        addChild(background)
        man = SKSpriteNode (texture: texture[1])
        man.zPosition = 2
        man.position = CGPoint(x: background.size.width/2, y: 50)
        addChild(man)
        man.run(SKAction.repeatForever(walkAnimation))
        man.run(moveR)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func manWalk (node: SKSpriteNode){
        var texture:[SKTexture] = []
        texture.append(SKTexture(imageNamed: "PrinceMove1"))
        texture.append(SKTexture(imageNamed: "PrinceMove2"))
        let walkAnimation = SKAction.animate(withNormalTextures: texture, timePerFrame: 0.1)
        let moveR = SKAction.moveBy(x: -200, y: 0, duration: 5)
        node.run(SKAction.repeatForever(walkAnimation))
        node.run(moveR)
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1080, height: 720))

if let scene = IntroScene(fileNamed: "IntroScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .resizeFill
    scene.size = sceneView.bounds.size
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView


