//
//  SongsDetailsViewController.swift
//  song-finder
//
//  Created by Adolfo Montilla on 23-03-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import UIKit
import AVFoundation

class SongsDetailsViewController: UIViewController
{
    
    @IBOutlet weak var imgSong: UIImageView!
    @IBOutlet weak var lblTrack: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    
    var songDetails = Results(artistName: "", trackName: "", collectionName: "", artworkUrl100: "", previewUrl: "" )
    
    var player: AVPlayer?
    
    var playerItem: AVPlayerItem?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadData()
        
        setupPlayer()
    }
    
    func loadData()
    {
        lblTrack.text = songDetails.trackName
        
        lblArtist.text = songDetails.artistName
        
        let fileUrl = URL(string: songDetails.artworkUrl100)
        
        self.imgSong.load(url: fileUrl!)
    }
    
    func setupPlayer()
    {
        let songUrl = URL(string: songDetails.previewUrl)
        
        let playerItem: AVPlayerItem = AVPlayerItem(url: songUrl!)

        player = AVPlayer(playerItem: playerItem)

    }
 
    @IBAction func btnPlay(_ sender: UIBarButtonItem)
    {
        if player?.rate == 0
        {
            player!.play()
        }
    }
    
    @IBAction func btnPause(_ sender: UIBarButtonItem)
    {
        if player?.rate != 0
        {
            player!.pause()
        }
    }
    
    @IBAction func btnRestart(_ sender: UIBarButtonItem)
    {
        if player?.rate == 0
        {
            player!.play()
        }
    }
}

extension UIImageView
{
    func load(url: URL)
    {
        DispatchQueue.global().async
        { [weak self] in
            if let data = try? Data(contentsOf: url)
            {
                if let image = UIImage(data: data)
                {
                    DispatchQueue.main.async
                    {
                        self?.image = image
                    }
                }
            }
        }
    }
}
