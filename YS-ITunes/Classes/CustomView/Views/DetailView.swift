//
//  DetailView.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class DetailView: BaseCustomView, NibLoadableView {
    
    @IBOutlet weak var imageViewArtWork: UIImageView!
    @IBOutlet weak var labelArtistName: UILabel!
    @IBOutlet weak var labelExplicitness: UILabel!
   
    @IBOutlet weak var labelKind: UILabel!
    @IBOutlet weak var labelCollectionName: UILabel!
    @IBOutlet weak var labelTrackName: UILabel!
    @IBOutlet weak var buttonURL: UIButton!
    
    var detailObject: SearchResult!
        {
        didSet{
            setupUI()
        }
    }
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    //MARK: - Setup UI
    private func setup() {
        nibSetup(DetailView.self)
    }
    
    private func setupUI() {
        setupImage()
        setupLabel()
    }
    
    private func setupImage() {
        
        if let imageStr = detailObject.artworkUrl100 {
            imageViewArtWork.downloadFromUrl(with: imageStr)
            return
        }
        if let imageStr = detailObject.artworkUrl60 {
            imageViewArtWork.downloadFromUrl(with: imageStr)
            return
        }
        if let imageStr = detailObject.artworkUrl30 {
            imageViewArtWork.downloadFromUrl(with: imageStr)
            return
        }
    }
    
    private func setupLabel() {
        labelArtistName.text = detailObject.artistName ?? ""
        labelTrackName.text = detailObject.trackName ?? ""
        labelCollectionName.text = detailObject.collectionName ?? ""
        labelExplicitness.text = detailObject.trackExplicitness ?? ""
        labelKind.text = detailObject.kind ?? ""
        
        if let urlStr = detailObject.artistViewUrl {
            buttonURL.setTitle(urlStr, for: .normal)
        } else {
            buttonURL.isUserInteractionEnabled = false
            buttonURL.setTitle("-", for: .normal)
        }
        
    }
    
    @IBAction func buttonURLTapped(_ sender: Any) {
        let application:UIApplication = UIApplication.shared
        if application.canOpenURL(URL(string: detailObject.artistViewUrl!)!) {
            application.openURL(URL(string: detailObject.artistViewUrl!)!)
        }
    }
}
