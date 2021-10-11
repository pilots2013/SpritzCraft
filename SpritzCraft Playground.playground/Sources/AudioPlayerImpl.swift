import Foundation

import AVKit

public class AudioPlayerImpl {
    
    public var currentMusicPlayer: AVAudioPlayer?
    public var currentEffectPlayer: AVAudioPlayer?
    public var musicVolume: Float = 1.0 {
        didSet { currentMusicPlayer?.volume = musicVolume }
    }
    public init() {
        
    }
    public var effectsVolume: Float = 1.0
}

extension AudioPlayerImpl: AudioPlayer {
    
    public func play(music: Music) {
        currentMusicPlayer?.stop()
        guard let newPlayer = try? AVAudioPlayer(soundFile: music) else { return }
        newPlayer.volume = musicVolume
        newPlayer.play()
        currentMusicPlayer = newPlayer
    }
    
    public func pause(music: Music) {
        currentMusicPlayer?.pause()
    }
    
    public func play(effect: Effect) {
        guard let effectPlayer = try? AVAudioPlayer(soundFile: effect) else { return }
        effectPlayer.volume = effectsVolume
        effectPlayer.play()
        currentEffectPlayer = effectPlayer
    }
}

