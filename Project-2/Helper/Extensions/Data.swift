//
//  Data.swift
//  Project-2
//
//  Created by Vsevolod Pavlovskyi on 21.02.2021.
//

import Foundation

extension Data {
    func decode<T: Decodable>(type: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: self)
            completion(.success(object))
        } catch {
            completion(.failure(error))
        }
    }

    func jsonObject() -> [String: Any]? {
        try? JSONSerialization.jsonObject(with: self, options: []) as? [String: Any]
    }
}
