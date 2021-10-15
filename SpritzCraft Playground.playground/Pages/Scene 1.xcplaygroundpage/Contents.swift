//: [Previous](@previous)


import Foundation
import PlaygroundSupport
import SpriteKit
import CoreGraphics
import SwiftUI



struct MenuView : View {
    
    var body: some View {
        
        ZStack {
            
            // BLACK BACKGROUND
            Rectangle()
                .fill(Color.black)
                .frame(width: 1920, height: 1080)
                .scaledToFit()
            
            // BEASTHEART LOGO
            Image(uiImage: UIImage(named: "LogoHeart")!)
                .resizable()
                .scaledToFit()
                .frame(width: 826, height: 661)
                .offset(x: 0, y: 0)

            
            
            VStack {
                
                // TITLE
                Image(uiImage: UIImage(named: "TitleBeast")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1472, height: 179)
                
                HStack {
                    
                    // START BUTTON
                    Button(action: {
//                        LAUNCH THE FIRST SCENE
                        let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1920, height: 1080))
                        if let scene = Scene1(fileNamed: "Scene1") {
                            // Set the scale mode to scale to fit the window
                            scene.scaleMode = .resizeFill
                            
                            // Present the scene
                            sceneView.presentScene(scene)
                            PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

                        }
                    }) {
                        Image(uiImage: UIImage(named: "StartButton")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 720, height: 660)
                    }
                    
                    //HOW TO PLAY BUTTON
                    Button(action: {
                        
//                        LAUNCH THE TUTORIAL
                        let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
                        if let scene = GameScene(fileNamed: "HowToPlay") {
                            // Set the scale mode to scale to fit the window
                            scene.scaleMode = .aspectFit
                            
                            // Present the scene
                            sceneView.presentScene(scene)
                            PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
                        }
                    }) {
                        Image (uiImage: UIImage(named: "HowToPlay")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 720, height: 660)
                    }
                    
                    
                }
                .offset(x: 0, y: 175)
                
            }
            
            
           
            
            
        }
        
        
        
    }
}

class GameScene: SKScene {
    
    private var label : SKLabelNode!
    private var spinnyNode : SKShapeNode!
    
    override func didMove(to view: SKView) {

    }
    
    @objc static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

class Scene1 : SKScene {
    let backgroundMusic = SKAudioNode(fileNamed: "Scene1Music")
    override func didMove(to view: SKView) {
        let wait = SKAction.wait(forDuration: 25)
        let fade = SKAction.changeVolume(to: 0, duration: 10)
        addChild(backgroundMusic)
        backgroundMusic.run(SKAction.play())
        backgroundMusic.run(SKAction.sequence([wait,fade]))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

PlaygroundPage.current.setLiveView(MenuView())



//: [Next](@next)


