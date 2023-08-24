//
//  URLManager.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/24.
//

import UIKit

class URLManager {
    static let shared = URLManager()
    
    private init() { }
    
    let url = URL(string: "https://t1.daumcdn.net/cfile/tistory/99A5444A5FE3EA890F?original")!
    let session = URLSession.shared
    
    /*
    func getJsonData(path: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.emptyResponse))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    */
    func getImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching image: \(error)")
                completion(nil)
                return
            }
            
            if let data = data,
               let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
enum NetworkError: Error {
    case emptyResponse
    case invalidResponse
    case unknown(String)
}
