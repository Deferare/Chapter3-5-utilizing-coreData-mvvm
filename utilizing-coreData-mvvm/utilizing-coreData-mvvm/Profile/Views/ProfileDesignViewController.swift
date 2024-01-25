//
//  ProfileDesignViewController.swift
//  utilizing-coreData-mvvm
//
//  Created by JiHoon K on 1/26/24.
//

import UIKit

class ProfileDesignViewController: UIViewController {
    var data: Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setUpView()
    }
    
    private func setUpView() {
        self.navigationItem.title = data?.userName
        
        let menuIcon = UIImageView(image: UIImage(named: "Menu"))
        menuIcon.layer.bounds.size = CGSize(width: 21, height: 17.5)
        menuIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedMenu(_:))))
        let rightItem = UIBarButtonItem(customView: menuIcon)
        
        self.navigationItem.setRightBarButton(rightItem, animated: true)
    }
    
    @objc
    private func tappedMenu(_ sender: UIGestureRecognizer) {
        print("tapped")
    }
}




