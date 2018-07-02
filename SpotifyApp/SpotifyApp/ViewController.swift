//
//  ViewController.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 30/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!

    let disposeBag = DisposeBag()
    var auth = SPTAuth.defaultInstance()
    var session: SPTSession!

    var player: SPTAudioStreamingController?
    var loginURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpSpotify()
        setUpBindings()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAfterFirstLogin), name: Notification.Name(rawValue: "loginSuccessfull"), object: nil)
    }

    func setUpSpotify() {
        SPTAuth.defaultInstance().clientID = SPOTIFY_CLIENT_ID
        SPTAuth.defaultInstance().redirectURL = URL(string: SPOTIFY_REDIRECT_URL)
        SPTAuth.defaultInstance().requestedScopes = [SPTAuthStreamingScope, SPTAuthPlaylistReadPrivateScope, SPTAuthPlaylistModifyPublicScope, SPTAuthPlaylistReadPrivateScope]
    
        loginURL = SPTAuth.defaultInstance().spotifyWebAuthenticationURL()
    }
    func setUpBindings() {
        loginButton.rx.tap.bind { [loginURL, auth] _ in

            UIApplication.shared.open(loginURL ?? URL(string: "")!, options: [:], completionHandler: { (done) in
                if done {
                    if (auth?.canHandle(auth?.redirectURL))! {

                    }
                }
            })
        }.disposed(by: disposeBag)
    }

    @objc func updateAfterFirstLogin() {

        if let sessionObject = UserDefaults.standard.object(forKey: "SpotifySession") as? AnyObject {
            guard let sessionDataObject = sessionObject as? Data, let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObject) as? SPTSession else {
                return
            }
            self.session = firstTimeSession
            initializePlayer(authSession: session)
        }
    }

    func initializePlayer(authSession: SPTSession) {
        if self.player == nil {
            self.player = SPTAudioStreamingController.sharedInstance()
            self.player?.playbackDelegate = self
            self.player?.delegate = self
            do {
                try player!.start(withClientId: auth?.clientID)
                self.player!.login(withAccessToken: authSession.accessToken)
            } catch(let error) {
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: SPTAudioStreamingDelegate {
    func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController!) {
    
        self.player?.playSpotifyURI("spotify:track:25qfFpoGhk9Njgu5nl36sS?si=WRRzKD7DTPiaQhufnQk-Cw", startingWith: 0, startingWithPosition: 0, callback: { (error) in

            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("playing")
            }


        })
    }
}

extension ViewController: SPTAudioStreamingPlaybackDelegate {
    
}

