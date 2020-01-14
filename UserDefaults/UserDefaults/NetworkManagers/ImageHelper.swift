//
//  ImageHelper.swift
//  UserDefaults
//
//  Created by Michelle Cueva on 9/28/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation


import UIKit

class ImageHelper {
    
    // MARK: - Static Properties
    
    static let shared = ImageHelper()
    
    // MARK: - Instance Methods
    
    func getImage(completionHandler: @escaping (Result<UIImage, AppError>) -> ()) {
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(.badURL))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataError))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(.notAnImage))
                return
            }
            
            completionHandler(.success(image))
            }.resume()
    }
    
    // MARK: - Private Properties and Initializers
    
    
    
    let urlStr = "https://giphy.com/gifs/walter-pix-mercado-cTraRt0bV7TzO"
    private init() {}
}
