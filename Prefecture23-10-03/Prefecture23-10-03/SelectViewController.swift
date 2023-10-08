//
//  SelectViewController.swift
//  Prefecture23-10-03
//
//  Created by 副山俊輔 on 2023/10/05.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SelectViewController", bundle: nil), forCellReuseIdentifier: "cell")
    }

}

extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = prefectures[indexPath.row]
        return cell
    }

}
