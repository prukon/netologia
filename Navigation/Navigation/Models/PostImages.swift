//
//  postImages.swift
//  Navigation
//
//  Created by Evgeniy Ustyan on 26.04.2023.
//

import UIKit

struct PostImages {
    
    var image: String
    
    static func maketPost() -> [PostImages] {
        
        var post = [PostImages]()
        post.append(PostImages(image: "blackCat"))
        post.append(PostImages(image: "blackDog"))
        post.append(PostImages(image: "blackMouse"))
        post.append(PostImages(image: "blackElefant"))
        post.append(PostImages(image: "blackBear"))
        post.append(PostImages(image: "blackDolphin"))
        post.append(PostImages(image: "blackEagle"))
        post.append(PostImages(image: "blackFox"))
        post.append(PostImages(image: "blackFlamigo"))
        post.append(PostImages(image: "blackGiraffe"))
        post.append(PostImages(image: "blackGorilla"))
        post.append(PostImages(image: "blackHourse"))
        post.append(PostImages(image: "blackLeopard"))
        post.append(PostImages(image: "blackMonkey"))
        post.append(PostImages(image: "blackMoose"))
        post.append(PostImages(image: "blackPanda"))
        post.append(PostImages(image: "blackRaccoon"))
        post.append(PostImages(image: "blackMonkey2"))
        post.append(PostImages(image: "blackShark"))
        post.append(PostImages(image: "blackSnake"))
        post.append(PostImages(image: "blackTiger"))
    
        return post
    }
}
