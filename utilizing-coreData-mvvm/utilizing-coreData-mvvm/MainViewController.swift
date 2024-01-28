//
//  MainViewController.swift
//  utilizing-coreData-mvvm
//
//  Created by JiHoon K on 1/26/24.
//

import UIKit

class MainViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(
            VStackView(spacing: 30, ([
                UIImageView(image: UIImage(named: "scc-og")),
                createButton("알림 확인하기") {
                    let todoVC = TodoViewController()
                    self.navigationController?.pushViewController(todoVC, animated: true)
                },
                createButton("완료한일 보기") {
                    let todoCompletedVC = TodoCompletedViewController()
                    self.navigationController?.pushViewController(todoCompletedVC, animated: true)
                },
                createButton("내 프로필") {
                    let profileVC = ProfileDesignViewController()
                    profileVC.data = Profile.getTestData()
                    self.navigationController?.pushViewController(profileVC, animated: true)
                },
            ]))
        )
        
        NSLayoutConstraint.activate([
            view.subviews.first!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.subviews.first!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        self.navigationController?.navigationBar.tintColor = .label
        self.title = ""
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

//MARK: - Views
extension MainViewController {
    private func createButton(_ title: String, action: @escaping () -> ()) -> UIButton {
        let button = UIButton(primaryAction: UIAction(handler: { _ in
            action()
        }))
        button.setTitle(title, for: .normal)
        return button
    }
}

@available(iOS 17, *)
#Preview("", traits: .defaultLayout) {
    let mainNavi = UINavigationController(rootViewController: MainViewController())
    mainNavi.isNavigationBarHidden = false
    return mainNavi
}
