//
//  FirebaseTweetsViewModel.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 14/5/23.
//

import FirebaseFirestore

class FirebaseTweetsViewModel: TweetsViewModelProtocol {
    private let db = Firestore.firestore()
    private let collectionName = "tweets"

    func fetchTweets(onSuccess: @escaping ([Tweet]) -> Void, onFailure: @escaping (Error) -> Void) {
        db.collection(collectionName)
            .order(by: "timestamp", descending: true)
            .addSnapshotListener({ querySnapshot, error in
                if let error = error {
                    onFailure(error)
                } else if let querySnapshot = querySnapshot {
                    var tweets: [Tweet] = []
                    for document in querySnapshot.documents {
                        if let tweet = Tweet(document: document) {
                            tweets.append(tweet)
                        }
                    }
                    onSuccess(tweets)
                }
            })
    }

    func postTweet(tweet: Tweet, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        db.collection(collectionName).addDocument(data: tweet.dictionary) { error in
            if let error = error {
                onFailure(error)
            } else {
                onSuccess()
            }
        }
    }
}
