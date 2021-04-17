//
//  ListViewModel.swift
//  LenskartAssignment
//
//  Created by Aman on 17/04/21.
//

import Foundation

class ListViewModel{
    
    private var movieModelArray: [MovieModel]!

    func getMoviesData(completion: @escaping (_ modelArray: [MovieModel]?, _ errorString: String?) -> Void){
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let arr  = try JSONDecoder().decode([MovieModel].self, from: data)
                self.movieModelArray = arr
                completion(movieModelArray, nil)
            }catch(let error){
                print(error.localizedDescription)
                completion(nil, error.localizedDescription)
            }
        }
    }
    
}
