//
//  ViewController.swift
//  Autolayouts
//
//  Created by Sai Sandeep on 29/12/19.
//  Copyright © 2019 iOS Revisited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imgView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var txtLbl: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var bgView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(bgView)
        bgView.edges([.all], to: self.view, offset: .init(top: 200, left: 30, bottom: -200, right: -30))
        
        bgView.addSubview(imgView)
        imgView.edges([.left, .right, .top], to: self.bgView, offset: .zero)
        imgView.size(width: nil, height: 250)
        imgView.setAttributes(imageName: "island", contentMode: .scaleAspectFill, clipsToBounds: true, cornerRadius: 10, maskedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        
        bgView.addSubview(txtLbl)
        txtLbl.edges([.left, .bottom, .right], to: self.bgView, offset: .init(top: 0, left: 20, bottom: 0, right: -20))
        txtLbl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 0).isActive = true
        txtLbl.setAttributes(text: "\"Maldives island is best for a honeymoon\"", linesCount: 0, textAlignment: .center, textColor: .black, font: UIFont.boldSystemFont(ofSize: 34))
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgView.addShadow(cornerRadius: 10)
    }
}
