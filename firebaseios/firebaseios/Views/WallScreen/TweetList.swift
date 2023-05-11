//
//  TweetList.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 12/5/23.
//

import SwiftUI

struct TweetList: View {
    @Binding var tweets: [Tweet]
    
    var body: some View {
        List(tweets) { tweet in
            TweetRow(tweet: tweet)
        }
        .navigationTitle("Tweets")
        .padding(.bottom)
    }
}
