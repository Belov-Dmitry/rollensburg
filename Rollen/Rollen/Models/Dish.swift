//
//  Dish.swift
//  Rollen
//
//  Created by Dmitry Belov on 18.11.2024.
//

import UIKit

struct DishType {
    let dishTypeName: String
    let dishTypeImage: UIImage
}

struct Dish: Decodable {
    let id: Int
    let type: String
    let name: String
    let imageName: String
    let ingredients: String
    let weight: Double
    let price: Double
    //let isAvailable: Bool
}
