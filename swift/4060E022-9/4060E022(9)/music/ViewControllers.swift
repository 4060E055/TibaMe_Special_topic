//
//  ViewController.swift
//  4060E055-Music
//
//  Created by guest1 on 2018/10/31.
//  Copyright © 2018年 dreamplatz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllers: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    var songs = [Dictionary<String,String>]()
    var audioPlayer = AVAudioPlayer()
    var timer = Timer()
    var currentTime:Double = 0.0
    
    @IBOutlet weak var labelSongname: UILabel!
    @IBOutlet var sliderProgress: UISlider!
    @IBOutlet var sliderVolume: UISlider!
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var buttonPause: UIButton!
    @IBOutlet var buttonStop: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songs = [["name":"V.K 克 - 鏡夜","imageName":"01"],["name":"V.K克 - 純白","imageName":"02"],["name":"V.K 克 - 琴之翼","imageName":"03"],["name":"V.K克[Evolution era]","imageName":"04"],["name":"V.K克[逆動‧平行時空]MV [Reverse ‧ Parallel Universe]","imageName":"05"],["name":"V.K克-精靈之歌","imageName":"06"],["name":"V.K 克 - 亞特蘭提斯之戀","imageName":"07"],["name":"V.K 克 - 淚的聲音","imageName":"08"],["name":"V.K 克 - 花水月","imageName":"09"],["name":"V.K 克 - 戀冬","imageName":"10"],["name":"V.K克 - 愛 無限","imageName":"11"],["name":"V.K克-守護天使","imageName":"12"],["name":"V.K克[十億光年的距離]","imageName":"13"],["name":"V.K克[蘭陵王]テーマ曲＜雪舞＞","imageName":"14"],["name":"V.K克-晨星","imageName":"15"],["name":"V.K克-[紙飛機的冒險]Paper Planes Adventure","imageName":"16"]]

        
        buttonShow(play: false,pause:false, stop:false, progress:false, volume:false)
    }
    
    @IBAction func sliderProgressChange(_ sender: UISlider) {
        audioPlayer.currentTime = audioPlayer.duration * Double(sender.value)
    }
    
    @IBAction func sliderVolumeChange(_ sender: UISlider) {
        audioPlayer.volume = sliderVolume.value
    }
    
    @IBAction func playClick(_ sender: UIButton) {
        audioPlayer.play()
        buttonShow(play: false,pause:true, stop:true, progress:true, volume:true)
    }
    
    @IBAction func pauseClick(_ sender: UIButton) {
        audioPlayer.pause()
        buttonShow(play: true,pause:false, stop:true, progress:true, volume:true)
    }
    
    @IBAction func stopClick(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        sliderProgress.value = 0
        buttonShow(play: true,pause:false, stop:false, progress:false, volume:false)
    }
    
    func buttonShow(play:Bool, pause:Bool, stop:Bool, progress:Bool, volume:Bool){
        buttonPlay.isEnabled = play
        buttonPause.isEnabled = pause
        buttonStop.isEnabled = stop
        sliderProgress.isEnabled = progress
        sliderVolume.isEnabled = volume
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int{
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SongTableViewCell
        var song: Dictionary<String,String> = songs[indexPath.row]
        
        cell.nameLabel.text = song["name"]
        cell.photoImageView.image = UIImage(named: song["imageName"]!)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        var song: Dictionary<String,String> = songs[indexPath.row]
        
        labelSongname.text = song["name"]
        let soundPath = Bundle.main.path(forResource: song["name"], ofType: "mp3")!
        let soundCurrent = URL(fileURLWithPath: soundPath)
        
        var error:NSError?
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundCurrent)
        }catch let error1 as NSError{
            error = error1
        }
        
        if(error != nil) {
            let alertController = UIAlertController(title: "錯誤", message: error?.localizedDescription, preferredStyle: .alert)
            let sureAction = UIAlertAction(title:"確定", style: .default, handler:nil)
            alertController.addAction(sureAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            audioPlayer.play()
            buttonShow(play: false, pause: true, stop: true, progress: true, volume: true)
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
        }
    }
    
    
    
    
    @objc func refresh(){
        sliderProgress.value = Float(audioPlayer.currentTime / audioPlayer.duration)
        if sliderProgress.value > 0.99{
            buttonShow(play: true, pause: false, stop: false, progress: false, volume: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
