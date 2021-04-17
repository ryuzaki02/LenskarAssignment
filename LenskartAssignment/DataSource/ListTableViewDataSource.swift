//
//  ListTableViewDataSource.swift
//  LenskartAssignment
//
//  Created by Aman on 17/04/21.
//

import Foundation
import UIKit

class ListTableViewDataSource : NSObject, UITableViewDataSource {
    
    private var movieModelArray: [MovieModel]!
    
    init(movieModelArray : [MovieModel]) {
        self.movieModelArray =  movieModelArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        let item = self.movieModelArray[indexPath.row]
        cell.configureCell(movieModel: item)
        return cell
    }
}
