//
//  DummyTweetsViewModel.swift
//  firebaseios
//
//  Created by Eric Risco de la Torre on 6/5/23.
//

import Foundation

class DummyTweetsViewModel: TweetsViewModelProtocol {
    func fetchTweets(onSuccess: @escaping ([Tweet]) -> Void, onFailure: @escaping (Error) -> Void) {
        let dummyTweets: [Tweet] = [
            Tweet(id: "1", userName: "Rubius", type: .TEXT, message: "¡Bienvenidos, flipaos, al directo más esperado!", timestamp: "20230101090000"),
            Tweet(id: "4", userName: "Auronplay", type: .TEXT, message: "Aquellos que hacen el bien son aquellos que no buscan reconocimiento", timestamp: "20230101120000"),
            Tweet(id: "5", userName: "TheGrefg", type: .IMAGE, message: "https://pbs.twimg.com/media/DpGF4aRX4AAdBYw.jpg", timestamp: "20230101130000"),
            Tweet(id: "6", userName: "Willyrex", type: .TEXT, message: "¡Ey muy buenas a todos! Aquí Willyrex comentando.", timestamp: "20230101140000"),
            Tweet(id: "11", userName: "Alexby11", type: .TEXT, message: "El éxito no es la clave de la felicidad. La felicidad es la clave del éxito", timestamp: "20230101190000"),
            Tweet(id: "15", userName: "Fargan", type: .TEXT, message: "No hay nada imposible, porque los sueños de ayer son las esperanzas de hoy y pueden convertirse en realidad mañana", timestamp: "20230101230000"),
            Tweet(id: "17", userName: "Lolito", type: .TEXT, message: "El éxito no es la clave de la felicidad. La felicidad es la clave del éxito", timestamp: "20230102010000"),
            Tweet(id: "21", userName: "estikk", type: .TEXT, message: "Me he enfrentado a innumerables retos de comida, pero hoy estoy aquí para comerme 200 aros de cebolla", timestamp: "20230101090000"),
            Tweet(id: "22", userName: "thegrefg", type: .TEXT, message: "TheGrefg siempre gana", timestamp: "20230101100000"),
            Tweet(id: "23", userName: "auronplay", type: .IMAGE, message: "https://phantom-marca.unidadeditorial.es/3ed1bd6925d36216d296d8c5e44b321a/crop/8x0/878x490/resize/1320/f/jpg/assets/multimedia/imagenes/2022/01/23/16429668459960.jpg", timestamp: "20230101110000"),
            Tweet(id: "24", userName: "willyrex", type: .TEXT, message: "¡Ey muy buenas a todos! Aquí Willyrex comentando.", timestamp: "20230101120000"),
            Tweet(id: "27", userName: "Rubius", type: .TEXT, message: "La risa es la mejor medicina", timestamp: "20230102030000"),
            Tweet(id: "29", userName: "TheGrefg", type: .TEXT, message: "Nunca renuncies a tus sueños", timestamp: "20230102050000"),
            Tweet(id: "31", userName: "Auronplay", type: .TEXT, message: "Nunca te rindas. Los milagros ocurren cada día", timestamp: "20230102070000")
        ]
        onSuccess(dummyTweets)
    }
    
    func postTweet(tweet: Tweet, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        onSuccess()
    }
}
