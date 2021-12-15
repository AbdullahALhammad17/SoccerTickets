//
//  FootballWorld.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 09/12/2021.
//

import UIKit

class FootballWorld: UITableViewCell {
    
    @IBOutlet weak var firstTeam: UIImageView!
    
    @IBOutlet weak var seccondTeam: UIImageView!
    
    @IBOutlet weak var firstScore: UILabel!
    
    @IBOutlet weak var seccondScore: UILabel!
    
    @IBOutlet weak var firstStatistic: UIProgressView!
    
    @IBOutlet weak var seccondStatistic: UIProgressView!
    
    @IBOutlet weak var thirdStatistic: UIProgressView!
    
    
    @IBOutlet weak var fourthStatistic: UIProgressView!
    
    @IBOutlet weak var fifthStatistic: UIProgressView!
    
    
    @IBOutlet weak var lastStatistic: UIProgressView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
