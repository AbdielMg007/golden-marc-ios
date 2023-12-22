//
//  LoadingVIewModel.swift
//  golden-marc
//
//  Created by Abdiel Mg on 06/12/23.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var userResponse: UserResponse?

    init() {
        fetchData()
    }

    func fetchData() {
        let url = URL(string: API_URL)!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error al obtener datos: \(error?.localizedDescription ?? "Desconocido")")
                return
            }

            do {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                if statusCode == 200 {
                    let decodedData = try JSONDecoder().decode(UserResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.userResponse = decodedData
                    }
                } else {
                    let errorResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.userResponse = errorResponse
                    }
                }
            } catch {
                print("Error al decodificar datos: \(error.localizedDescription)")
            }
        }.resume()
    }
}
