//
//  ProfileDesignViewController.swift
//  utilizing-coreData-mvvm
//
//  Created by JiHoon K on 1/26/24.
//

import UIKit

class ProfileDesignViewController: UIViewController {
    var data: Profile?
    var galleryCollectionVC = GalleryCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNeviBar()
        
        let headerView = createHeaderView()
        let bioView = createBioView()
        let middleBar = createMiddleBar()
        let divider = createDivider()
        let galleryNav = createGalleryNav()
        
        view.addSubview(
            VStackView(spacing: 14, alignment: .fill, distribution: .fill ,[
                headerView,
                bioView,
                middleBar,
                divider,
                galleryNav,
                galleryCollectionVC.view
            ])
        )

        NSLayoutConstraint.activate([
            view.subviews.first!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            view.subviews.first!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            view.subviews.first!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            view.subviews.first!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bioView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            bioView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            galleryNav.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            galleryNav.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            galleryCollectionVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            galleryCollectionVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            galleryCollectionVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
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
    
    private func createBioView() -> VStackView {
        let nameLabel: UILabel = {
            if data?.name == nil { return UILabel() }
            let nameLabel: UILabel = UILabel()
            nameLabel.font = .systemFont(ofSize: 14, weight: .bold)
            nameLabel.textColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
            nameLabel.text = data?.name
            return nameLabel
        }()
        
        let bioLabel: UILabel = {
            if data?.bio == nil { return UILabel() }
            let bioLabel: UILabel = UILabel()
            bioLabel.font = .systemFont(ofSize: 14, weight: .regular)
            bioLabel.textColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
            bioLabel.text = data?.bio
            return bioLabel
        }()
        
        let linkLabel: UILabel = {
            if data?.linkInBio == nil { return UILabel() }
            let linkLabel: UILabel = UILabel()
            linkLabel.font = .systemFont(ofSize: 14, weight: .regular)
            linkLabel.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
            linkLabel.text = data?.linkInBio
            return linkLabel
        }()
        
        return VStackView(spacing: 2, alignment: .leading,[
            nameLabel,
            bioLabel,
            linkLabel,
        ])
    }
    
    private func createMiddleBar() -> HStackView {
        let followButton: UIButton = {
            let button = UIButton(primaryAction: .init(handler: { action in
                
            }))
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            button.tintColor = .white
            button.setTitle("Follow", for: .normal)
            button.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
            button.layer.cornerRadius = 4
            return button
        }()
        
        let messageButton: UIButton = {
            let button = UIButton(primaryAction: .init(handler: { action in
                
            }))
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            button.tintColor = .black
            button.setTitle("Message", for: .normal)
            button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
            button.layer.borderWidth = 1.5
            button.layer.cornerRadius = 4
            return button
        }()
        
        let moreButton: UIButton = {
            let button = UIButton(type: .custom, primaryAction: .init(handler: { _ in
                
            }))
            button.setImage(UIImage(named: "More"), for: .normal)
            button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
            button.layer.borderWidth = 1.5
            button.layer.cornerRadius = 4
            button.widthAnchor.constraint(equalToConstant: 30).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            return button
        }()
        
        return HStackView(spacing: 8, alignment: .fill, distribution: .fill ,[
            HStackView(spacing: 8, alignment: .fill, distribution: .fillEqually ,[
               followButton,
               messageButton,
            ]),
           moreButton
        ])
    }
    
    private func createDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1)
        divider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return divider
    }
    
    private func createGalleryNav() -> HStackView {
        let galleryButton: UIButton = {
            let button = UIButton(configuration: .plain(), primaryAction: .init(handler: { _ in
                print("Grid")
            }))
            button.setImage(UIImage(named: "Grid"), for: .normal)
            return button
        }()
        
        return HStackView(spacing: 0, alignment: .center, distribution: .fillEqually ,[
            UIView(),
            galleryButton,
            UIView(),
            UIView(),
//            button2
            UIView(),
            UIView(),
//            button3
            UIView(),
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
