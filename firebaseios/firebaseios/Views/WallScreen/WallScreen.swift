//
//  WallScreen.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 6/5/23.
//

import SwiftUI

struct WallScreen: View {
    
    @Environment(\.tweetsViewModel) private var tweetsViewModel: TweetsViewModelProtocol
    @Environment(\.storageViewModel) private var storageViewModel: StorageViewModelProtocol
    @Environment(\.authViewModel) private var authViewModel: AuthViewModelProtocol
    @Environment(\.logViewModel) private var logViewModel: LogViewModelProtocol
    
    @State private var tweets: [Tweet] = []
    @State private var tweetMessage: String = ""
    
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    @Binding var isLoggedIn: Bool
    
    private static var viewName: String = "WallScreen"
    
    var body: some View {
        NavigationView {
            VStack {
                TweetList(tweets: $tweets)
                TweetInput(tweetMessage: $tweetMessage, isShowingImagePicker: $isShowingImagePicker, selectedImage: $selectedImage)
            }
            .onAppear(perform: fetchTweets)
            .navigationBarItems(trailing: logoutButton)
        }
    }
    
    private func fetchTweets() {
        tweetsViewModel.fetchTweets(
            onSuccess: { fetchedTweets in
                self.tweets = fetchedTweets
            },
            onFailure: { error in
                logViewModel.crash(screen: WallScreen.viewName, exception: error)
            }
        )
    }
    
    private var logoutButton: some View {
        Button(action: {
            authViewModel.logout(
                onSuccess: {
                    isLoggedIn = false
                    logViewModel.log(screen: WallScreen.viewName, action: "USER_LOGGED_OUT")
                },
                onFailure: { error in
                    logViewModel.crash(screen: WallScreen.viewName, exception: error)
                }
            )
        }) {
            Text("Logout")
        }
    }
}
