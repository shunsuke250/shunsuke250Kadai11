//
//  ViewController.swift
//  Prefecture23-10-03
//
//  Created by 副山俊輔 on 2023/10/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var prefectureLabel: UILabel!

    @IBAction private func didTapSelectButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let navigationController = storyboard.instantiateViewController(
            withIdentifier: "NavigationController") as? UINavigationController {
            if let selectViewController = navigationController.topViewController as? SelectViewController {
                selectViewController.delegate = self
                selectViewController.title = "都道府県"
            }
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        }
    }
}

extension ViewController: SelectViewControllerDelegate {
    func didSelectPrefecture(selectedPrefecture: String) {
        prefectureLabel.text = selectedPrefecture
    }
}
