//
//  TableViewCell.swift
//  Qquiz
//
//  Created by Fahim Rahman on 1/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

var selectedStates = SelectedStates()

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    
    var delegate: SelectedOptionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button1.layer.cornerRadius = 25
        button2.layer.cornerRadius = 25
        
        button1.layer.masksToBounds = true
        button2.layer.masksToBounds = true
        
        button1.layer.borderWidth = 2
        button2.layer.borderWidth = 2
        
        button1.layer.borderColor = CGColor(srgbRed: 255/255, green: 126/255, blue: 121/255, alpha: 1)
        button2.layer.borderColor = CGColor(srgbRed: 255/255, green: 126/255, blue: 121/255, alpha: 1)
        
        correctAnswerLabel.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userInteraction(isEnabled: true)
        
        correctAnswerLabel.isHidden = true
        
        button1.backgroundColor = UIColor.white
        button2.backgroundColor = UIColor.white
        
        button1.setTitleColor(UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1), for: .normal)
        button2.setTitleColor(UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1), for: .normal)
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    
    @IBAction func button1Action(_ sender: UIButton) {
        
        button1.backgroundColor = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1)
        button1.setTitleColor(.white, for: .normal)
        
        button1.isUserInteractionEnabled = false
        button2.isUserInteractionEnabled = false
        
        correctAnswerLabel.isHidden = false
        
        delegate?.selectedOption(option: String(button1.titleLabel?.text ?? ""))
        
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        
        selectedStates.selectedRowsForButton1.append(indexPath.row)
        
    }
    
    
    @IBAction func button2Action(_ sender: UIButton) {
        
        button2.backgroundColor = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1)
        button2.setTitleColor(.white, for: .normal)
        
        button1.isUserInteractionEnabled = false
        button2.isUserInteractionEnabled = false
        
        correctAnswerLabel.isHidden = false
        
        delegate?.selectedOption(option: String(button2.titleLabel?.text ?? "nill"))
        
        let indexPath: NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        
        selectedStates.selectedRowsForButton2.append(indexPath.row)
        
    }
    
    func userInteraction(isEnabled: Bool) {
        
        button1.isUserInteractionEnabled = isEnabled
        button2.isUserInteractionEnabled = isEnabled
        
    }
}
