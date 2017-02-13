//
//  MemeDetailViewController.swift
//  MemeMe 2.0
//
//  Created by Arpit Jain on 2/12/17.
//  Copyright © 2017 Arpit Jain. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var meme:Meme!
    @IBOutlet weak var memeImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        memeImageView.image = meme.memedImage
    }
}
