//
//  ViewController.swift
//  BelajarJSON
//
//  Created by iav on 28/03/20.
//  Copyright © 2020 iav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var heroes = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = heroes[indexPath.row].localized_name.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinaton = segue.destination as? HeroViewController {
            destinaton.hero = heroes[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func getDataJSON(completed: @escaping () -> () ){
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        URLSession.shared.dataTask(with: url!) { (data, responses, error) in
            if (error == nil){
                do {
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch{
                    print("JSON Erro")
                }
            }
        }.resume()
    }

}

