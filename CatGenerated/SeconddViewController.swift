//
//  SeconddViewController.swift
//  CatGenerated
//
//  Created by Mac on 24.12.2024.
//

import UIKit

struct SeconddVCInput {
    let imageData: Data
}

final class SeconddViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!


    private var input: SeconddVCInput?

    func setInput(with input: SeconddVCInput) {
        self.input = input
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let input = input {
            catImageView.image = UIImage(data: input.imageData)
        }
    }

}
