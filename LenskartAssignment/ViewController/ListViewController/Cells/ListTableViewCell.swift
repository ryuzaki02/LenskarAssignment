//
//  ListTableViewCell.swift
//  LenskartAssignment
//
//  Created by Aman on 17/04/21.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        moviewImageView.image = nil
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(movieModel: MovieModel) {
        titleLabel.text = movieModel.movieTitle ?? "Not Available"
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
                self.moviewImageView.image = image
            }
        }
    }
    
}
