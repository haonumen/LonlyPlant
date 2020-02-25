//
//  SpotsDetailsViewController.swift
//  LonlyPlanet
//
//  Created by Hao Qiang on 2020/2/12.
//  Copyright © 2020 Hao Qiang. All rights reserved.
//

import UIKit
import SafariServices

class SpotsDetailsViewController: UIViewController, UIContextMenuInteractionDelegate{
    @IBOutlet weak var spotWhyVisit: UILabel!
    @IBOutlet weak var spotWhatToSee: UILabel!
    @IBOutlet weak var spotWeather: UILabel!
    @IBOutlet weak var submitRatingButton: UIButton!
    @IBOutlet weak var averageRatingView: FivePointStarView!
    @IBOutlet weak var yourRatingStackView: UIStackView!
    @IBOutlet weak var yourStarRatingView: FivePointStarView!
    
    
    
    var spot: SpotsModel!
    var myRating: Int = 0
    @IBAction func hideWeatherInfo(_ sender: UIButton) {
        if sender.currentTitle == "Hide" {
            self.spotWeather.isHidden = true
            sender.setTitle("Show", for: .normal)
        }else if sender.currentTitle == "Show" {
            self.spotWeather.isHidden = false
            sender.setTitle("Hide", for: .normal)
        }
    }
    
    @IBAction func openWikiMedia(_ sender: UIButton) {
        if let url = URL(string: self.spot.wikipediaLink) {
            let safari = SFSafariViewController(url: url)
            present(safari,animated: true,completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapDetail" {
            let destController = segue.destination as! MapViewController
            destController.latitude = self.spot.latitude
            destController.longitude = self.spot.longitude
            destController.title = self.spot.name
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(spot.name)
        print(spot.locationName)
        print(spot.latitude)
        print(spot.userRating)
        // Do any additional setup after loading the view.
        title = spot.name
        self.spotWhyVisit?.text = self.spot.whyVisit
        self.spotWhatToSee?.text = self.spot.whatToSee
        self.spotWeather?.text = self.spot.weatherInfo
        averageRatingView.refreshView(numberOfStars: spot.userRating)
        
        submitRatingButton.addInteraction(UIContextMenuInteraction(delegate: self))
    }
    
    func createFiveStar() -> UIViewController {
        let vc = UIViewController()
        
        let iv = UIImageView(image: UIImage(systemName: "star.fill"))
        iv.frame = CGRect(x: 0,y: 0, width: 100,height: 100)
        iv.tintColor = .systemYellow
        vc.view =   iv
        vc.preferredContentSize = iv.frame.size
        return vc
    }
    
    func refreshMyRatingView() {
        if self.myRating > 0 {
            self.yourRatingStackView.isHidden =  false
            self.yourStarRatingView.refreshView(numberOfStars: self.myRating)
            self.submitRatingButton.setTitle("Update Rating (\(self.myRating))", for: .normal)
        } else {
            self.yourRatingStackView.isHidden = true
            self.submitRatingButton.setTitle("Submit Rating", for: .normal)
        }
    }
    
    func createPopmenu() -> UIMenu {
        let list = ["Boring", "Meh", "It's OK", "Like it", "Fantastic!"]
        var actions: [UIAction] = []
        
        (0..<list.count).forEach {
            index in actions.append(UIAction(title: list[index],
                                             identifier: UIAction.Identifier(rawValue: "\(index + 1)")) {
                                                (action:UIAction) in
                                                    self.myRating = Int(action.identifier.rawValue)!
                                                    self.refreshMyRatingView()
                }
            )
        }
        return UIMenu(title: "Star Rating",
                      options: .displayInline,
        children: actions)
    }
    
    func removePopmenu() -> UIAction {
        var removeAttr  = UIMenuElement.Attributes.destructive
        
        if(myRating == 0) {
            removeAttr.insert(.disabled)
        }
        return UIAction(title: "Remove Rating",
                      image: UIImage(systemName: "delete.left"),
                      attributes: removeAttr) {
                        (ation: UIAction) in
                        self.myRating = 0
                        self.refreshMyRatingView()
        }
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: {() -> UIViewController? in return self.createFiveStar()}) {
            _ in
            return UIMenu(title: "", children: [self.createPopmenu(),self.removePopmenu()])
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
