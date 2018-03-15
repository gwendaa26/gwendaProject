//
//  detailViewController.swift
//  Worldwide
//
//  Created by Gwenda Hasna'a on 3/15/18.
//  Copyright © 2018 Gwenda Hasna'a. All rights reserved.
//
//  This page is showing the list of country, which obtained from the API (Rest Countries) "https://restcountries.eu/rest/v2/all". The user will be directed to this page, when they clicked to COUNTRY button in the home page.
//  I was helped by a source from youtube to finalize the task, especially for declaring the API in UITableView.
//  Source: https://www.youtube.com/watch?v=FNkS_QIngg8&t=929s
//


import UIKit

class detailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = countryList[indexPath.row].name.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? fileViewController {
            destination.detail = countryList[(countryTable.indexPathForSelectedRow?.row)!]
    }

    }
    

    @IBOutlet weak var countryTable: UITableView!
    
    // Obtain the data
    var countryList = [Countries]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the data in UITableView.
        downloadJSON {
            self.countryTable.reloadData()
        }
        
            countryTable.delegate = self
            countryTable.dataSource = self
    }

    // Implement the API
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            if error ==  nil {
                do {
                    self.countryList = try JSONDecoder().decode([Countries].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print ("JSON Error")
                }
            }
        }.resume()
    }
}
