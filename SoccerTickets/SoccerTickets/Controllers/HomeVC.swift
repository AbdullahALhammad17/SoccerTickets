//
//  HomeVC.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 09/12/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        globalMatches()
//        tableView.dataSource = self
//        tableView.delegate = self
    }
    
    func globalMatches() {
       // let semaphore = DispatchSemaphore (value: 0)

        let url =  "https://v3.football.api-sports.io/fixtures"
        
        var urlComponent = URLComponents(string: url)!
        urlComponent.queryItems = [URLQueryItem(name: "live", value: "all")]
        var request = URLRequest(url: urlComponent.url!)
        request.addValue("781a74afdaf39bccbc9be46eff441d22", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")


        
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
               // semaphore.signal()
                
                return
              }
              print(String(data: data, encoding: .utf8)!)
              //semaphore.signal()
            
            let jsonDecoder = JSONDecoder()
            do {
                let fixture : Welcome = try jsonDecoder.decode(Welcome.self, from: data)
                
                print("fixture.results:\(fixture.welcomeGet)")
            }
            catch {
                print("error")
            }
            
            
    }
        task.resume()
       // semaphore.wait()

}
}
//
//extension HomeVC: UITableViewDataSource, UITableViewDelegate{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return
//    }
//
//
//
//
//}
