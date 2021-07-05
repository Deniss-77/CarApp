//
//  NetworkManager.swift
//  СarApp
//
//  Created by Denis Kravets on 30.06.2021.
//

import Foundation

class NetworkManager {
    
    /// Получение данных с сервера  по производителям
    /// - Parameter completion: сompletion с результатом типа данных DataOfManufacturer или Error
    
    func fetchDataOfManufacturer(completion: @escaping (Result<[DataOfManufacturer], Error>) -> Void ) {
        
        let urlString = "https://www.mocky.io/v2/5db959e43000005a005ee206"
        guard let url = URL(string: urlString) else { return }
                                            
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let manufacturer = try decoder.decode(ManufacturerModel.self, from: data)
                completion(.success(manufacturer.data))
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    /// Получение данных с сервера  по моделям машин
    /// - Parameter completion: сompletion с результатом типа данных DataOfCars или Error
    
    func fetchDataOfCars(completion: @escaping (Result<[DataOfCars], Error>) -> Void ) {
        
        let urlString = "https://www.mocky.io/v2/5db9630530000095005ee272"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let cars = try decoder.decode(CarsModel.self, from: data)
                completion(.success(cars.data))
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
}
