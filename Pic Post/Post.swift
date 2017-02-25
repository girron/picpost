//
//  Post.swift
//  Pic Post
//
//  Created by Jake Bush on 2/20/17.
//  Copyright © 2017 Henry Swanson. All rights reserved.
//

import Foundation
import Firebase


class Post {
    
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    private var _comment: String!
    private var _postRef: FIRDatabaseReference!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    var comment: String {
        return _comment
    }
    
    init(caption: String, imageUrl: String, likes: Int, comment: String) {
        self._caption = caption
        self._imageUrl = imageUrl
        self._likes = likes
        self._comment = comment
    }
    
    init(postKey: String, postData: [String: AnyObject]) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageurl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
        
        if let comment = postData["comment"] as? String {
            self._comment = comment
        }
        
        _postRef = DataService.ds.REF_POSTS.child(_postKey)
        
    }

    func adjustLikes(addLike: Bool) {
        if addLike {
            _likes = _likes + 1
        } else {
            _likes = _likes - 1
        }
        
        _postRef.child("likes").setValue(_likes)
    }
}
