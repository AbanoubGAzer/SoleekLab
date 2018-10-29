//
//  HomeCV.swift
//  SoleekLabApplication
//
//  Created by Abanoub on 10/23/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit
import FirebaseAuth
class HomeCV: UIViewController , UITableViewDataSource, UITableViewDelegate{
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    @IBOutlet weak var CountriesTableView: UITableView!
    var Countries:[[String:AnyObject]] = []
 
    var CountriesName = [String]()
    @IBAction func SignOutButtonAction(_ sender: Any) {
        
       try? Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CountriesName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell()
        cell.textLabel?.text = CountriesName[indexPath.row]
        return cell
        
        
        
 
    }
    
 

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CountriesTableView.delegate = self
        CountriesTableView.dataSource = self
        
        let website = URL(string: "https://restcountries.eu/rest/v2/all?fields=name")
        let task  =  URLSession.shared.dataTask(with: website!) { (data, response, error)
            in
            if error != nil
            {
                print("failed")
                
            }
                
            else
            {
                if let countries = data
                {
                    do
                    {
                        let MyJson = try JSONSerialization.jsonObject(with: countries, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        
                        self.Countries = MyJson as! [[String:AnyObject]]
                        for fields in self.Countries {
                            self.CountriesName.append(fields["name"] as! String)
                        }
                        print(self.CountriesName)
                        
                        
                        
                    }
                    catch
                    {
                        
                    }
                }
                
            }
            
            
            
        }
        
        task.resume()
        
        
        
        
    }

        
}
