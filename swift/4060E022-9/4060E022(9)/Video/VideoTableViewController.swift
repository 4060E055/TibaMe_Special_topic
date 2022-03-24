//
//  VideoTableViewController.swift
//  4060E055-VideoPoayer(6)
//
//  Created by guest1 on 2018/12/5.
//  Copyright © 2018年 Animal. All rights reserved.
//
import UIKit
import AVFoundation
//import AVKit

class VideoTableViewController: UITableViewController {
    
    var videos = [[String:String]]()
    var name : Array<String> = [String]()
    var imageName : Array<String> = [String]()
    var contents: Array<String> = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = ["6-1","6-2","6-3","6-4","6-5","6-6","6-7","6-8","6-9","6-10","6-11","6-12"]
        
        imageName = ["6-1","6-2","6-3","6-4","6-5","6-6","6-7","6-8","6-9","6-10","6-11","6-12"]
        
        for item in 0..<name.count {
            let content = loadString(imageName[item])
            let dic = ["name": name[item],"imageName": imageName[item],"content": content]
            videos.append(dic)
        }
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,
                              NSAttributedStringKey.backgroundColor:UIColor.black,
                              NSAttributedStringKey.font:UIFont (name: "Georgia-Bold", size: 24)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadString (_ nameofFile: String) -> String {
        var stringContenta = ""
        if let filepath = Bundle.main.path(forResource: nameofFile, ofType: "txt") {
            do {
                stringContenta = try String(contentsOfFile: filepath)
            } catch {
                //contents could not be looaded
            }
        } else {
            // example.txt not found!
        }
        return stringContenta
    }
    
    func videoPreviewUIImage(_ fileName: String) -> UIImage? {
        let videoPath = Bundle.main.path(forResource: fileName, ofType: "mp4")
        let videoURL = URL(fileURLWithPath: videoPath!)
        
        let asset = AVURLAsset(url: videoURL as URL)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        
        
        let timestamp = CMTime(seconds: 20, preferredTimescale: 60)
        
        do{
            let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch let error as NSError {
            print("Image generation failed with error \(error)")
            return nil
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell{
            
            let cellIdentifier = "VideoCell"
            guard let videoCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for:indexPath) as? VideoTableViewCell else {
                fatalError("The dequeued cell is not an instance of VideoTableViewCell.")
            }
            let video = videos[indexPath.row]
            videoCell.nameLabel.text = video["name"]
            videoCell.videoImage.image = videoPreviewUIImage(video["imageName"]!)
            
            return videoCell
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: {(action,indexPath) -> Void in
            let video = self.videos[indexPath.row]
            let defaultText = "Share " + video["name"]!
            
            if let imageToShare = UIImage(named: video["imageName"]!){
                let activityControl = UIActivityViewController(activityItems: [defaultText,imageToShare], applicationActivities: nil)
                self.present(activityControl, animated: true, completion: nil)
            }
        })
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action,indexPath) -> Void in
            self.videos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.8/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.6/255.0, green: 292.8/255.0, blue:203.8/255.0, alpha: 1.0)
        tableView.reloadData()
        return [deleteAction, shareAction]
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "VideoDetail" {
            let indexPath = tableView.indexPathForSelectedRow!
            let destinationController = segue.destination as! VideoDetaViewController
            let selectedVideo = videos[indexPath.row]
            destinationController.videoItem = selectedVideo
            destinationController.videoPreview = videoPreviewUIImage(selectedVideo["imageName"]!)
            
        }
        
    }
    
    
}
