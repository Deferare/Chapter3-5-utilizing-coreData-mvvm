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

        let headerView = createHeaderView()
        
        view.addSubview(
            VStackView([
                headerView,
                
            ])
        )
        
        setUpNeviBar()
        
        NSLayoutConstraint.activate([
            view.subviews.first!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            view.subviews.first!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            view.subviews.first!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}

//MARK: - Views
extension ProfileDesignViewController {
    private func setUpNeviBar() {
        self.navigationItem.title = data?.userName
        
        let menuIcon = UIImageView(image: UIImage(named: "Menu"))
        menuIcon.layer.bounds.size = CGSize(width: 21, height: 17.5)
        menuIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedMenu(_:))))
        let rightItem = UIBarButtonItem(customView: menuIcon)
        
        self.navigationItem.setRightBarButton(rightItem, animated: true)
        view.backgroundColor = .systemBackground
    }
    
    private func createHeaderView() -> HStackView {
        let profileImage: UIImageView = {
            let profileImage = UIImageView()
            profileImage.contentMode = .left
            profileImage.image = UIImage(named: "ProfileImage")
            profileImage.widthAnchor.constraint(equalToConstant: 88).isActive = true
            profileImage.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            return profileImage
        }()
        
        let infoView: (String, Int) -> VStackView = { title, number in
            let numberLabel = UILabel()
            numberLabel.font = .systemFont(ofSize: 16.5, weight: .bold)
            numberLabel.text = "\(number)"
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
            
            return VStackView([
                numberLabel,
                titleLabel
            ])
        }
        
        return HStackView(alignment: .center, distribution: .equalCentering, [
            profileImage,
            infoView("post", data?.postNumber ?? 0),
            infoView("follower", data?.followerNumber ?? 0),
            infoView("following", data?.followingNumber ?? 0),
        ])
    }
}


//MARK: - Actions
extension ProfileDesignViewController {
    @objc
    private func tappedMenu(_ sender: UIGestureRecognizer) {
        print("tapped")
    }
}

@available(iOS 17, *)
#Preview("", traits: .defaultLayout) {
    let mainNavi = UINavigationController()
    mainNavi.navigationBar.tintColor = .label
    
    let mainVC = MainViewController()
    mainVC.title = ""
    
    let profileVC = ProfileDesignViewController()
    profileVC.data = Profile.getTestData()
    
    mainNavi.viewControllers = [mainVC, profileVC]
    
    return mainNavi
}





