//
//  TRWMoviesTableViewController.swift
//  MovieSearchObjC
//
//  Created by Travis Wheeler on 10/11/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

import UIKit

class TRWMoviesTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TRWMovieSearchController.shared().fetchMovies { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Movie source of truth is empty")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TRWMovieSearchController.shared().movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? TRWMovieTableViewCell else {return UITableViewCell()}
        
        let movie = TRWMovieSearchController.shared().movies[indexPath.row]

        // Configure the cell...

        return cell
    }
}
