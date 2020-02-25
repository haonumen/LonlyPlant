//
//  FivePointStarView.swift
//  LonlyPlanet
//
//  Created by Hao Qiang on 2020/2/14.
//  Copyright © 2020 Hao Qiang. All rights reserved.
//

import UIKit

class FivePointStarView: UIView {
    
    private var numberOfStars: Int = 5
    private var tilesOfStarStackView: UIStackView!
    
    convenience init(count: Int = 5) {
        self.init()
        self.numberOfStars = count
    }
   
    convenience init(frame: CGRect, count: Int = 5) {
        self.init(frame: frame)
        self.numberOfStars = count
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        populateStarStackView()
    }
    
    
}

extension FivePointStarView{
    public func refreshView(numberOfStars: Int) {
        self.numberOfStars = numberOfStars
        tilesOfStarStackView.removeFromSuperview()
        populateStarStackView()
    }
    
    private func populateStarStackView() {
        let tilesOfView = generateTilesOfStar()
        addSubview(tilesOfView)
        tilesOfView.tintColor = .systemYellow
        tilesOfView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            tilesOfView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tilesOfView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            tilesOfView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tilesOfView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
        self.tilesOfStarStackView = tilesOfView
    }
    
    fileprivate func generateFiveStarImageView() -> UIImageView {
        let fivePointStartImageView = UIImageView(frame: .init(x: 0, y: 0, width: 15, height: 15))
        fivePointStartImageView.contentMode =  .scaleAspectFit
        fivePointStartImageView.image = UIImage(systemName: "star.fill")
        return fivePointStartImageView
    }
    
    fileprivate func generateStartImageViewArray() -> [UIImageView] {
        var viewArr = [UIImageView]()
        (0..<numberOfStars).forEach { index in
            viewArr.append(self.generateFiveStarImageView())
        }
        return viewArr
    }
    
    fileprivate func generateTilesOfStar() -> UIStackView {
        let tiles = UIStackView(arrangedSubviews: generateStartImageViewArray())
        tiles.alignment = .fill
        tiles.distribution = .fillEqually
        tiles.axis = .horizontal
        tiles.spacing = 5
        
        return tiles
    }
}
