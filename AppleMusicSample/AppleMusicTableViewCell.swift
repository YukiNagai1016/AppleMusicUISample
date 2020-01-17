//
//  AppleMusicTableViewCell.swift
//  AppleMusicSample
//
//  Created by 優樹永井 on 2020/01/17.
//  Copyright © 2020 com.nagai. All rights reserved.

import UIKit

class AppleMusicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var musicCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCollectionViewDelegate<Datasource: UICollectionViewDataSource, Delegate: UICollectionViewDelegate> (dataSource: Datasource, delegate: Delegate, forRow row: Int) {
        let nib = UINib(nibName: "AppleMusicCollectionViewCell", bundle: Bundle.main)
        musicCollectionView.register(nib, forCellWithReuseIdentifier: "AppleMusicCollectionViewCell")
        
        musicCollectionView.delegate = delegate
        musicCollectionView.dataSource = dataSource
        musicCollectionView.tag = row
        musicCollectionView.reloadData()
    }
    
    
}
