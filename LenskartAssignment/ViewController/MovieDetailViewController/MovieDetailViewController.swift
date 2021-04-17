//
//  MovieDetailViewController.swift
//  LenskartAssignment
//
//  Created by Aman on 17/04/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movieModel: MovieModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.title = "Movie Detail"
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Setup UI
    private func setupUI(){
        titleLabel.text = movieModel.movieTitle
        overviewLabel.text = movieModel.overview
        if let poster = movieModel.posterPath{
            setImage(from: poster)
        }
    }
    
    private func setImage(from url: String) {
        guard let imageURL = URL(string: Constants.baseURL+url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.movieImageView.image = image
            }
        }
    }

}
