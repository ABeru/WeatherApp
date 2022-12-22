//  
//  GetMediaFileNetworkGateway.swift
//  WeatherApp
//
//  Created by Sandro Beruashvili on 22/12/2022.
//

import UIKit

// MARK: - GetMediaFile Network Gateway
struct GetMediaFileNetworkGateway: GetMediaFileGateway {
    func fetch(
        with parameters: GetMediaFileGatewayParameters,
        completion: @escaping (Result<GetMediaFileEntity, any Error>) -> Void
    ) {
        switch ImageCacheStorage.shared[url: parameters.fileUrl] {
        case nil:
            let url = URL(string: "https:\(parameters.fileUrl)")!
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else {
                    completion(.failure(error!))
                    return  }
                
                let entity: GetMediaFileEntity = .init(
                    image: UIImage(data: data)!
                )
                
                if let image: UIImage = .init(data: data) {
                    ImageCacheStorage.shared[url: parameters.fileUrl] = image
                }
                DispatchQueue.main.async {
                    completion(.success(entity))
                }
                
            }
            task.resume()
            
        case let image?:
            let entity: GetMediaFileEntity = .init(
                image: image
            )
            
            DispatchQueue.main.async {
                completion(.success(entity))
            }

        }
    }
}

// MARK: - Image Cache Storage
private final class ImageCacheStorage {
    // MARK: Properties
    static let shared: ImageCacheStorage = .init()
    
    private let cache: NSCache<NSString, UIImage> = {
        let cache: NSCache<NSString, UIImage> = .init()
        cache.countLimit = 50
        return cache
    }()
    
    // MARK: Initializers
    private init() {}
    
    // MARK: Subscript
    subscript(url url: String) -> UIImage? {
        get {
            cache.object(forKey: .init(string: url))
        }
        set {
            if let image = newValue {
                cache.setObject(image, forKey: .init(string: url))
            } else {
                cache.removeObject(forKey: .init(string: url))
            }
        }
    }
}
