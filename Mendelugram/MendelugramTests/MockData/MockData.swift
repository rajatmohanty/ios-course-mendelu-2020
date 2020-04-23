//
//  MockData.swift
//  MendelugramTests
//
//  Created by Tomas Cejka on 4/23/20.
//  Copyright © 2020 ČVUT. All rights reserved.
//

import Foundation
@testable import Mendelugram

// MARK: - Constants (static)
struct MockData {

    static private let casey = Author(username: "caseyneistat", name: "Casey Neistat", avatarId: "casey")
    static private let selena = Author(username: "selenagomez", name: "Selena Gomez", avatarId: "selena")

    static let mockPhoto = Photo(
        author: MockData.selena,
        likesCount: 6543234567,
        description: "bla bla bla",
        locationName: nil,
        comments: [],
        photoId: "selena-2"
    )
    static let mockPhoto2 = Photo(
        author: MockData.selena,
        likesCount: 3456789,
        description: "bla bla bla",
        locationName: nil,
        comments: [],
        photoId: "selena-3"
    )
    static let mockPhoto3 = Photo(
        author: MockData.casey,
        likesCount: 76543,
        description: "bla bla bla",
        locationName: nil,
        comments: [],
        photoId: "casey-3"
    )
}
