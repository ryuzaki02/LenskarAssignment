//
//  ListViewController.swift
//  LenskartAssignment
//
//  Created by Aman on 17/04/21.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var listViewModel : ListViewModel!
    private var dataSource : ListTableViewDataSource!
    private var movieModelArray: [MovieModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        setupTableView()
        navigationItem.title = "Movie List"
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Setup Table view
    private func setupTableView(){
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
    }
    
    private func callToViewModelForUIUpdate(){
        self.listViewModel =  ListViewModel()
        listViewModel.getMoviesData {[weak self] (movieArray, error) in
            if let movieArray = movieArray{
                self?.movieModelArray = movieArray
                self?.updateDataSource(movieModelArray: movieArray)
            }
        }
    }
    
    //MARK:- Table view data source
    private func updateDataSource(movieModelArray: [MovieModel]){
        dataSource = ListTableViewDataSource(movieModelArray: movieModelArray)
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
    
    //MARK:- Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        detailVC.movieModel = movieModelArray[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
