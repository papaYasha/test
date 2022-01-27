//
//  ViewController.swift
//  test
//
//  Created by Macbook on 27.01.22.
//

import UIKit

class ShowVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - ViewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addGradient()
        navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Functions
    
    func presentContentVC() {
        let storyboard = UIStoryboard(name: K.storyboardName, bundle: nil)
        guard let contentVC = storyboard.instantiateViewController(identifier: K.contentVCID) as? ContentVC else { return }
        self.present(contentVC, animated: true, completion: nil)
    }
    
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = containerView.bounds
        gradientLayer.colors = [
            UIColor(red: 0.41, green: 0.40, blue: 0.67, alpha: 1.00).cgColor,
            UIColor(red: 1.00, green: 0.74, blue: 0.82, alpha: 1.00).cgColor
        ]
        containerView.layer.addSublayer(gradientLayer)
    }
    
    //MARK: - IBActions
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        presentContentVC()
    }
}
