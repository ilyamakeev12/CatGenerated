//
//  ViewController.swift
//  CatGenerated
//
//  Created by Mac on 24.12.2024.
//

import UIKit

final class CatGenerateViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var catImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))

        view.addGestureRecognizer(gestureRecognizer)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object:nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification , object:nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
       let keyboardHeight = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height

    }

    @objc func keyboardWillHide(notification: NSNotification) {
       let keyboardHeight = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height

    }

    @objc
    private func didTapView() {
        view.endEditing(true)
    }

    @IBAction func didTapCatGenerateButton(_ sender: Any) {
       downloadCat()
    }


    private func downloadCat() {
        guard let url = URL(string: "https://cataas.com/cat") else {
            return
        }


        print(Thread.current)
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            print(Thread.current)
            guard let data = data else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                print(Thread.current)
                self?.imgData = data
                self?.performSegue(withIdentifier: "showCatImageSegue", sender: self)
            }
        }

        task.resume()
    }

    private var imgData: Data?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if segue.identifier == "showCatImageSegue" {
            guard
                let viewController: SeconddViewController = segue.destination as? SeconddViewController,
                let imgData = imgData
            else {
                return
            }

            viewController.setInput(with: SeconddVCInput(imageData: imgData))
        }
    }
}
