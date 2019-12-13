//
//  ImageDownloader.swift
//  Euphony
//
//  Created by Vinay Bharwani on 12/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    static let shared = ImageDownloader()
    private init(){}
    
    static let cache = NSCache<NSString,UIImage>()
    var albumImage : UIImage?
    
    
    func convertStringToImage(_ imgStr: String)->UIImage{
//        if let imageUrl = URL(string: imgStr){
        getImage(from: URL(string: imgStr)){
                image in
                DispatchQueue.main.async {
                    self.albumImage = image
                }
            }
//        }
        return albumImage ?? UIImage(named: "settings")!
    }
    
    func getImage(from url: URL?, completion: @escaping (_ image: UIImage?) -> ()){
        
        guard let url = url else {
            completion(UIImage(named: "settings") ?? UIImage())
            return
        }
        if let image = ImageDownloader.cache.object(forKey: url.absoluteString as NSString){
            completion(image)
        } else{
            downloadImageFromURL(from: url, completionHandler: completion)
        }
    }
    /// Actual download happens here and image is stored in cache memory
    func downloadImageFromURL(from url: URL, completionHandler: @escaping (UIImage) -> ()){
        downloadImgFromURL(completionHandler: { (downloadedImage) in
            ImageDownloader.cache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
            completionHandler(downloadedImage)
        }, from: url)
    }
    
    func downloadImgFromURL(completionHandler: @escaping (UIImage) -> (),from url: URL?){
        
        guard let url = url else {
            completionHandler(UIImage(named: "settings") ?? UIImage())
            return
        }
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            guard let recData = data, error == nil else{
                print("Image download failed")
                return
            }
            
            completionHandler(UIImage(data: recData) ?? UIImage())
            }.resume()
    }
}
