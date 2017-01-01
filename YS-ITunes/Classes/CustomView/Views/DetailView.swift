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
    
    var detailObject: SearchResult!
        {
        didSet{
            setupUI()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
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
        labelArtistName.text = detailObject.artistName
    }
}
