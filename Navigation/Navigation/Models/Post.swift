//
//  Post.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 24.04.2023.
//

import UIKit

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static func maketPost() -> [Post] {
        var post = [Post]()
        
        post.append(Post(author: "Нетология", description: "Веселый слоник довел до истерики свою жену...", image: "elefant", likes: 22, views: 41))
        post.append(Post(author: "Яндекс", description: "Веселый котик разоблачил тайну покрытую мраком...", image: "cat", likes: 25, views: 61))
        post.append(Post(author: "Озон", description: "Веселая собачка греется от вентиляции крипто-фермы...", image: "dog", likes: 32, views: 55))
        post.append(Post(author: "Розовый кролик", description: "Веселая мышка странный сверток на углу дома. Больше ее не видели...", image: "mouse", likes: 11, views: 15))
      
        return post
    }
}
