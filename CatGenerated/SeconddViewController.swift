//
//  SeconddViewController.swift
//  CatGenerated
//
//  Created by Mac on 24.12.2024.
//

import UIKit

struct SeconddVCInput {
    let imageData: Data
    let userText: String

}

final class SeconddViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!

    private var imageData: Data?
    private var userText: String?

    private var input: SeconddVCInput?

    func setInput(with input: SeconddVCInput) {
        self.input = input
        self.userText = input.userText
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let input = input {
            catImageView.image = UIImage(data: input.imageData)
        }
        textLabel.text = userText
    }

}
