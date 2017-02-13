//
//  CollectionViewController.swift
//  MemeMe 2.0
//
//  Created by Arpit Jain on 2/11/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import UIKit

class SentMemeCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    var memes = [Meme]()
    
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(SentMemeCollectionViewController.memeEditor))
        
        let space:CGFloat = 3.0
        let xDimension = (view.frame.size.width - (2 * space)) / 3.0
        let yDimension = (view.frame.size.height - (2 * space)) / 3.0
        
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: xDimension, height: yDimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView!.reloadData()
    }
    
    func memeEditor() {
        
        let controler:MemeEditorVC
        controler = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorVC
        present(controler, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! MemeCollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.memeImageView?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMeme = memes[indexPath.row]
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        controller.meme = selectedMeme
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
