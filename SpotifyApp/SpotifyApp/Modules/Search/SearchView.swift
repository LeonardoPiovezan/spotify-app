//
//  SearchView.swift
//  SpotifyApp
//
//  Created by Leonardo Augusto Piovezan on 04/06/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchView: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchBar.rx.text
        .orEmpty
        .debounce(0.5, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe(onNext: {text in
                print(text)
            }).disposed(by: disposeBag)
        
        tableView.register(cellType: SearchViewCell.self)
        Observable.of(["1", "2", "3", "4", "5"]).bind(to: tableView.rx.items(cellIdentifier: "SearchViewCell", cellType: SearchViewCell.self)) { _, model, cell in
            cell.nameLabel.text = model
        }.disposed(by: disposeBag)      
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
