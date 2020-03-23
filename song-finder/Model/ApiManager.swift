//
//  ApiManager.swift
//  song-finder
//
//  Created by Adolfo Montilla on 22-03-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation

protocol ApiManagerDelegate
{
    func didUpdatedsongList(_ apiManager: ApiManager, apiData: ApiData)
    func didFailWithError(error: Error)
 
}

struct ApiManager
{
    let apiUrl = "https://itunes.apple.com/"
    
    var delegate: ApiManagerDelegate?
    
    func fetchSongs(term: String)
    {
        var urlString = "\(apiUrl)search?term=\(term)"
        urlString = urlString.replacingOccurrences(of: " ", with: "+")
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String)
    {
        if let url = URL(string: urlString)
        {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {( data, response, error) in
                
                if error != nil
                {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data
                {
                    if let apiData = self.parseJSON(safeData)
                    {
                        self.delegate?.didUpdatedsongList(self, apiData: apiData)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ apiData: Data) -> ApiData?
    {
        let decoder = JSONDecoder()
        
        do
        {
            let decoderData = try decoder.decode(ApiData.self, from: apiData)
            
            let resultCount = decoderData.resultCount
            
            let results = decoderData.results
            
            let apiData = ApiData(resultCount: resultCount, results: results)
            
            return apiData

        }
        catch
        {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
