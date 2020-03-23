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

    var apiManager = ApiManager()
    
    var itemArray = ApiData(resultCount: 0, results: [])
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        apiManager.delegate = self
    }

    //MARK: - Table View Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return itemArray.resultCount
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray.results[indexPath.row].trackName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let destinationVc = segue.destination as! SongsDetailsViewController
        
        if let indexPath = tableView.indexPathForSelectedRow
        {
            destinationVc.songDetails = itemArray.results[indexPath.row]
        }
    }

}

//MARK: - Search Bar Methods

extension SongsListViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        if let term = searchBar.text
        {
            self.apiManager.fetchSongs(term: term)
        }
        
    }
}

//MARK: - Delegate Methods

extension SongsListViewController: ApiManagerDelegate
{
    func didUpdatedsongList(_ apiManager: ApiManager, apiData: ApiData)
    {
        DispatchQueue.main.async
        {
            self.itemArray = apiData
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error)
    {
        print(error)
    }
}
