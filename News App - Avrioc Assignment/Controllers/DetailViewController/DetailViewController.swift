//
//  DetailViewController.swift
//  News App - Avrioc Assignment
//
//  Created by Ammar Ul Haq on 15/10/2023.
//

import UIKit

class DetailViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var imgArtical: UIImageView!
    @IBOutlet weak var txtviewArtical: UITextView!
    
    
    //view Model
    var detailViewModel: NewsDetailViewModel?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        
        
    }
    
    func configView()
    {
        overrideUserInterfaceStyle = .light   
        self.txtviewArtical.text = detailViewModel!.description ?? ""
        self.imgArtical.setImage(with: detailViewModel!.articalImage ?? "")
        self.imgArtical.layer.cornerRadius = 8
    }
    

    

}
