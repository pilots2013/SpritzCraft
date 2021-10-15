import SwiftUI
import PlaygroundSupport

struct MenuView : View {
    
    var body: some View {
        
        ZStack {
            
            // Sfondo Nero
            Rectangle()
                .fill(Color.black)
                .frame(width: 1920, height: 1080)
                .scaledToFit()
            
            // Logo BeastHeart
            Image(uiImage: UIImage(named: "LogoHeart")!)
                .resizable()
                .scaledToFit()
                .frame(width: 826, height: 661)                 .offset(x: 0, y: 0)

            
            
            VStack {
                
                // Titolo
                Image(uiImage: UIImage(named: "TitleBeast")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1472, height: 179)
                
                HStack {
                    
                    // Bottone start
                    Button(action: {
                        print("StartButton was tapped")
                    }) {
                        Image(uiImage: UIImage(named: "StartButton")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 720, height: 660)
                    }
                    
                    // Bottone come giocare
                    Button(action: {
                        print("Howtoplay was tapped")
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


PlaygroundPage.current.setLiveView(MenuView())
