//
//  ViewController.swift
//  RedditClone
//
//  Created by Türker on 12.10.2021.
//

import UIKit

final class RedditViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private lazy var redditArray = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getRedditArray()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
    }
}

// MARK: UITableView Delegate&DataSource Methods
extension RedditViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redditArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.redditCell.rawValue, for: indexPath) as? RedditTableViewCell else { return UITableViewCell()}
        cell.configureTableViewOutlets(with: redditArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330.0
    }
}

// MARK: Fetch Reddit Data Method
extension RedditViewController {
    func getRedditArray() {
        NetworkManager().fetchReddit() { [weak self] redditResponse in
            guard let self = self else { return }
            self.redditArray.append(contentsOf: redditResponse)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


