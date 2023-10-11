//
//  SelectViewController.swift
//  Prefecture23-10-03
//
//  Created by 副山俊輔 on 2023/10/05.
//

import UIKit

protocol SelectViewControllerDelegate: AnyObject {
    func didSelectPrefecture(selectedPrefecture: String)
}

class SelectViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    weak var delegate: SelectViewControllerDelegate?

    private let prefectures: [String] = [
        "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県",
        "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県",
        "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県",
        "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県",
        "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県",
        "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県",
        "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction private func didTapCancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectPrefecture(selectedPrefecture: prefectures[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
