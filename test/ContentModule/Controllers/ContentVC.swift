//
//  ContentVC.swift
//  test
//
//  Created by Macbook on 27.01.22.
//

import UIKit

class ContentVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    //MARK: - var, let
    
    var hits: [ImageItemResponse] = []
    var imageManager = ImageManager()
    let service = ImageService.shared
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    //MARK: - Functions
    
    private func config() {
        createDelegate()
        configTableView()
        loadImagesInfo()
        configInfoView()
        configTapGesutreRecognizer()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createDelegate() {
        imageManager.delegate = self
    }
    
    private func configInfoView() {
        infoView.isHidden = true
    }
    
    private func configTapGesutreRecognizer() {
        tapGestureRecognizer.isEnabled = false
    }
    
    private func loadImagesInfo() {
        imageManager.loadImagesInfo { mapped in
            self.hits = self.service.sortByLikes(mapped.hits)
            self.tableView.reloadData()
        }
    }
    
    //MARK: - IBAction
    
    @IBAction func tapOnBlur(_ sender: UIGestureRecognizer) {
        UIView.animate(withDuration: 0.25) {
            self.blur.alpha = 0
            self.infoView.isHidden = true
        }
        sender.isEnabled = false
    }
}

//MARK: - Extesion TableViewDelegate

extension ContentVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tapGestureRecognizer.isEnabled = true
        let models = hits[indexPath.row]
        likesLabel.text = String(models.likes)
        commentsLabel.text = String(models.comments)
        downloadsLabel.text = String(models.downloads)
        UIView.animate(withDuration: 0.25) {
            self.blur.alpha = 1
            self.infoView.isHidden = false
        }
    }
}

//MARK: - Extension TableViewDataSource

extension ContentVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let model = hits[indexPath.row]
        cell.indexPath = indexPath
        imageManager.loadImage(model: model) { image in
            if cell.indexPath == indexPath {
                cell.iconImageView.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

//MARK: - Extension ImageManagerDelegate

extension ContentVC: ImageManagerDelegate {
    
    func didFailWithError() {
        showAlert()
    }
    
    func showAlert() {
            let alert = UIAlertController(title: "Network Error", message: "The network connection is lost", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                print("You choose OK")
            }))
            self.present(alert, animated: true)
    }
}
