//
//  BaseAPI.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/4/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI <T : TargetType> {
    
    func fetchData <M : Decodable>(target : T, responseClass : M.Type, completion : @escaping (Result<M?, Error>) -> Void ){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).responseData { (response) in
            switch response.result{
            case .success(let data):
                let decoder = JSONDecoder()
                do{
                    let responseObject = try decoder.decode(responseClass.self
                        , from: data)
                    completion(.success(responseObject))
                }catch{
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
}

