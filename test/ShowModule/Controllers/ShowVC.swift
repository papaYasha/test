//
//  ViewController.swift
//  test
//
//  Created by Macbook on 27.01.22.
//

import UIKit

class ShowVC: UIViewController {

    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - ViewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Functions
    
    func presentContentVC() {
        let storyboard = UIStoryboard(name: K.storyboardName, bundle: nil)
        guard let contentVC = storyboard.instantiateViewController(identifier: K.contentVCID) as? ContentVC else { return }
        self.present(contentVC, animated: true, completion: nil)
    }
    
    //MARK: - IBActions
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        presentContentVC()
    }
}

