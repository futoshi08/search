//
//  ViewController.swift
//  app2021
//
//  Created by futoshi on 2021/04/07.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTopLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    private var repositories: [Repository] = []
    //タップした時の遷移先のviewControllerに渡す変数
    private var giveData :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "RepositoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Repository")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = .init()
        
        searchBar.delegate = self
        
        progressView.isHidden = true
        
        searchTopLabel.layer.borderWidth = 2
        searchTopLabel.layer.borderColor = UIColor.black.cgColor
   }
}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Repository") as! RepositoryCell
        cell.repository = repositories[indexPath.row]
        
        return cell
    }
    //選択された際に呼び出されるブロック:didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(repositories[indexPath.row].name)が選択されました")
        //選択されたセルの解除
        tableView.deselectRow(at: indexPath, animated: true)
        //delegateの設定
        giveData = repositories[indexPath.row].name
        
        //別の画面へ遷移
        performSegue(withIdentifier:"toSecond", sender: nil)
    }
    
    //遷移先のviewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let vc = segue.destination as! secondViewController
            vc.receiveData = giveData
        }
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        searchBar.resignFirstResponder()
        indicator.startAnimating()
        progressView.isHidden = false
        RepositoryAPI.searchRepository(with: text) { [unowned self, tableView] (result) in
            self.progressView.isHidden = true
            self.indicator.stopAnimating()
            switch result {
            case let .success(repositories):
                self.repositories = repositories
                tableView?.reloadData()
            case let .failure(error):
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(.init(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}




