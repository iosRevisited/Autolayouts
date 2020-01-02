//
//  Utilities.swift
//  Autolayouts
//
//  Created by Sai Sandeep on 29/12/19.
//  Copyright © 2019 iOS Revisited. All rights reserved.
//

import UIKit

extension UIView {
    
    func size(width: CGFloat? = nil, height: CGFloat? = nil) {
        var constraints = [NSLayoutConstraint]()
        if width != nil {
            constraints.append(self.widthAnchor.constraint(equalToConstant: width!))
        }
        if height != nil {
            constraints.append(self.heightAnchor.constraint(equalToConstant: height!))
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    func edges(_ edges: UIRectEdge, to view: UIView, offset: UIEdgeInsets) {
        if edges.contains(.top) || edges.contains(.all) {
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: offset.top).isActive = true
        }
        
        if edges.contains(.bottom) || edges.contains(.all) {
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: offset.bottom).isActive = true
        }
        
        if edges.contains(.left) || edges.contains(.all) {
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset.left).isActive = true
        }
        
        if edges.contains(.right) || edges.contains(.all) {
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: offset.right).isActive = true
        }
    }
    
    func edges(_ edges: UIRectEdge, to layoutGuide: UILayoutGuide, offset: UIEdgeInsets) {
        if edges.contains(.top) || edges.contains(.all) {
            self.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: offset.top).isActive = true
        }
        
        if edges.contains(.bottom) || edges.contains(.all) {
            self.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: offset.bottom).isActive = true
        }
        
        if edges.contains(.left) || edges.contains(.all) {
            self.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: offset.left).isActive = true
        }
        
        if edges.contains(.right) || edges.contains(.all) {
            self.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: offset.right).isActive = true
        }
    }
    
    func addShadow(cornerRadius: CGFloat, fillColor: UIColor = UIColor.white, shadowColor: UIColor = UIColor.black) {
        if let subLayers = self.layer.sublayers {
            for layer in subLayers {
                if let shapeLayer = layer as? CAShapeLayer {
                    shapeLayer.removeFromSuperlayer()
                }
            }
        }
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 3
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
    
}

extension UIImageView {
    
   func setAttributes(imageName: String? = nil, contentMode: ContentMode = .scaleToFill, clipsToBounds: Bool = false, cornerRadius: CGFloat = 0, maskedCorners: CACornerMask? = nil) {
        self.contentMode = contentMode
        self.clipsToBounds = clipsToBounds
        self.image = imageName != nil ? UIImage(named: imageName!) : nil
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = cornerRadius > 0 ? true : false
        if maskedCorners != nil {
            self.layer.maskedCorners = maskedCorners!
        }
    }
}

extension UILabel {
    
    func setAttributes(text: String? = nil, linesCount: Int = 1, textAlignment: NSTextAlignment = .left, textColor: UIColor = .black, font: UIFont = UIFont.systemFont(ofSize: 14)) {
        self.text = text
        self.numberOfLines = linesCount
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
        self.adjustsFontSizeToFitWidth = true
    }
}
