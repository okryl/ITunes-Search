//
//  SearchCell.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell, ReusableCell,NibLoadableView {

    @IBOutlet weak var labelArtistName: UILabel!
    @IBOutlet weak var imageViewArtWork: UIImageView!    
    @IBOutlet weak var labelKind: UILabel!
    @IBOutlet weak var labelTrackName: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Setup UI
    func setup(searchResult: SearchResult!) {
        labelArtistName.text = searchResult.artistName
        labelKind.text = searchResult.kind
        labelTrackName.text = searchResult.trackName
        
        if let imageStr = searchResult.artworkUrl60 {
             imageViewArtWork.downloadFromUrl(with: imageStr)
        } else if let imageStr = searchResult.artworkUrl30  {
            imageViewArtWork.downloadFromUrl(with: imageStr)
        }
    }
}
