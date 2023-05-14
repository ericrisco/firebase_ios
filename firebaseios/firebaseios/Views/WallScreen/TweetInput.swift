//
//  TweetInput.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 12/5/23.
//

import SwiftUI

struct TweetInput: View {
    
    @Environment(\.tweetsViewModel) private var tweetsViewModel: TweetsViewModelProtocol
    @Environment(\.storageViewModel) private var storageViewModel: StorageViewModelProtocol
    @Environment(\.authViewModel) private var authViewModel: AuthViewModelProtocol
    @Environment(\.logViewModel) private var logViewModel: LogViewModelProtocol
    
    @Binding var tweetMessage: String
    @Binding var isShowingImagePicker: Bool
    @Binding var selectedImage: UIImage?
    
    private static var viewName: String = "TweetInput"
    
    var body: some View {
        VStack {
            TextField("Escribe tu tweet...", text: $tweetMessage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button(action: {
                    sendTextTweet()
                }) {
                    Text("Enviar mensaje")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.trailing)

                Button(action: {
                    isShowingImagePicker = true
                }) {
                    Text("Enviar imagen")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isShowingImagePicker, onDismiss: {
                    sendImageTweet()
                }) {
                    ImagePicker(image: $selectedImage)
                }
            }
            .padding(.bottom)
        }
    }
    
    private func sendTextTweet() {
        authViewModel.getUser { user in
            
            let tweet = Tweet(id: UUID().uuidString,
                              userName: user.email,
                              type: .TEXT, message:
                                tweetMessage,
                              timestamp: Date().currentDate)
            
            tweetsViewModel.postTweet(tweet: tweet) {
                tweetMessage = ""
                logViewModel.log(screen: TweetInput.viewName, action: "TWEET_MESSAGE_POSTED")
            } onFailure: { error in
                logViewModel.crash(screen: TweetInput.viewName, exception: error)
            }
            
        } onFailure: { error in
            logViewModel.crash(screen: TweetInput.viewName, exception: error)
        }
    }

    private func sendImageTweet() {
        authViewModel.getUser { user in
            
            guard let selectedImage = selectedImage else { return }
            
            guard let imageData = selectedImage.jpegData(compressionQuality: 0.75) else { return }
            guard let compressedImage = UIImage(data: imageData) else { return }
            
            storageViewModel.uploadImage(image: compressedImage) { url in
                
                let tweet = Tweet(id: UUID().uuidString,
                                  userName: user.email,
                                  type: .IMAGE,
                                  message: url,
                                  timestamp: Date().currentDate)
                
                tweetsViewModel.postTweet(tweet: tweet, onSuccess: {
                    tweetMessage = ""
                    logViewModel.log(screen: TweetInput.viewName, action: "TWEET_MESSAGE_POSTED")
                }, onFailure: { error in
                    print("Error posting tweet: \(error)")
                })
                
            } onFailure: { error in
                logViewModel.crash(screen: TweetInput.viewName, exception: error)
            }
            
        } onFailure: { error in
            logViewModel.crash(screen: TweetInput.viewName, exception: error)
        }
    }
}
