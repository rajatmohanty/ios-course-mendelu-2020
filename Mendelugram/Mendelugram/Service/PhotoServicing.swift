//
//  PhotoServicing.swift
//  Mendelugram
//
//  Created by Pacek on 25/04/2019.
//

import UIKit

protocol PhotosServicing {

    static var shared: PhotosServicing { get }
    
    func fetchPhotos(completion: @escaping ([Photo]) -> Void)

}
