//
//  TweetsViewModelProtocol.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 6/5/23.
//

import Foundation

protocol TweetsViewModelProtocol {
    func fetchTweets(onSuccess: @escaping ([Tweet]) -> Void, onFailure: @escaping (Error) -> Void)
    func postTweet(tweet: Tweet, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void)
}
