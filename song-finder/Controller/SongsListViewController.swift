//
//  ViewController.swift
//  song-finder
//
//  Created by Adolfo Montilla on 22-03-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import UIKit

class SongsListViewController: UITableViewController
{

    let itemArray = ["Song 1", "Song 2", " song 3","Song 4", "Song 5", " song 6","Song 7", "Song 8", " song 9","Song 10", "Song 11", " song 12","Song 13", "Song 14", " song 15","Song 16", "Song 17", " song 18","Song 19", "Song 2", " song 3"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    //MARK: - Table View Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return itemArray.count
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
}

//MARK: - Search Bar Methods

extension SongsListViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        
    }
    
}
