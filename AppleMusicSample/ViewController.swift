//
//  ViewController.swift
//  AppleMusicSample
//
//  Created by 優樹永井 on 2020/01/17.
//  Copyright © 2020 com.nagai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var helloArray = ["おはよう", "こんにちは", "こんばんは", "さようなら", "またあおう", "でんぎでね"]
    
    @IBOutlet weak var appleMusicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
    }
    
    func configureTableView() {
        appleMusicTableView.dataSource = self
        appleMusicTableView.delegate = self
        
        let cell = UINib(nibName: "AppleMusicTableViewCell", bundle: Bundle.main)
        appleMusicTableView.register(cell, forCellReuseIdentifier: "AppleMusicTableViewCell")

        appleMusicTableView.separatorStyle = .none
        appleMusicTableView.tableFooterView = UIView()
        
        appleMusicTableView.rowHeight = 250.0
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppleMusicTableViewCell") as! AppleMusicTableViewCell
        cell.categoryNameLabel.text = helloArray[indexPath.row]
        cell.setCollectionViewDelegate(dataSource: self, delegate: self, forRow: indexPath.row)
        return cell
    }
}

extension ViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 5
        } else if collectionView.tag == 1 {
            return 2
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleMusicCollectionViewCell", for: indexPath) as! AppleMusicCollectionViewCell
        
        cell.musicImageView.image = UIImage(named: "ドン.jpg")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionView.frame.size.width / 2 - 8 , height: collectionView.frame.size.width / 2 - 8)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
        
        return cell
    }
}

