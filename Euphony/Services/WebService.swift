//
//  WebService.swift
//  Euphony
//
//  Created by Vinay Bharwani on 11/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation
class WebService{
    
    func getMusic(_ url: URL, completion: @escaping ([Track]?) -> ()){
        var request = URLRequest(url: url)
        request.httpMethod = NetworkUtils.HTTPMethods.get
        request.addValue(NetworkUtils.HTTPMethods.get, forHTTPHeaderField: NetworkUtils.HeaderKeys.contentType)
        request.addValue(NetworkUtils.Mains.accessToken, forHTTPHeaderField: NetworkUtils.HeaderKeys.authorization)
        
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
        
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200{
                guard let data = data else{ return }
                DispatchQueue.main.async {
                    do{
                        let recommendation = try JSONDecoder().decode(Recommendation.self, from: data)
                        completion(recommendation.tracks)
                    } catch let error{
                        print("Error: \(error)")
                    }
                }
            } else{
                print("HTTPURLResponse code: \(response.statusCode) Error Description: \(response.description)")
            }
        }.resume()
        
    }
}
