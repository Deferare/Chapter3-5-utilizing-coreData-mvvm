//
//  Profile.swift
//  utilizing-coreData-mvvm
//
//  Created by JiHoon K on 1/26/24.
//

import Foundation
import UIKit

struct Profile {
    let userName: String
    let imageName: String
    let postNumber: Int
    let followerNumber: Int
    let followingNumber: Int
    let name: String?
    let bio: String?
    let linkInBio : String?
    let contentImages: [UIImage]?
}

extension Profile {
    static func getTestData() -> Profile {
        return Profile(userName: "Deferare", imageName: "", postNumber: 3, followerNumber: 6, followingNumber: 3, name: "강지훈", bio: "Hi there!", linkInBio: "https://github.com/Deferare", contentImages: nil)
    }
}
