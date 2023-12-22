//
//  UserResponse.swift
//  golden-marc
//
//  Created by Abdiel Mg on 06/12/23.
//

struct UserResponse: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var userName: String
    var role: Int
    var keyOffice: Int
    var token: String?
    var error: String?
}
