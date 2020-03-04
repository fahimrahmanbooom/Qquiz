//
//  ViewController.swift
//  Qquiz
//
//  Created by Fahim Rahman on 1/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var data = [Data]()
    var score: Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "QQuiz"
        
        scoreLabel.text = "Score: 0"
        score = 0
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        getData()
    }
    
    func getData() {
        
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        guard let jsonData = try? String(contentsOfFile: path).data(using: .utf8) else { return }
        guard let json = try? JSONDecoder().decode([Data].self, from: jsonData) else { return }
        for i in 0...json.count - 1 {
            data.append(json[i])
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource, SelectedOptionDelegate {
    
    func selectedOption(option: String) {
        
        for i in 0...data.count - 1 {
            
            if data[i].correctanswer == option {
                score += 1
                scoreLabel.text = "Score: \(score)"
            }
        }
        //print("score:", score)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        DispatchQueue.main.async {
            
            cell.questionLabel.text = "\(self.data[indexPath.row].question!)"
            
            cell.button1.setTitle("\(self.data[indexPath.row].optionOne!)", for: .normal)
            cell.button2.setTitle("\(self.data[indexPath.row].optionTwo!)", for: .normal)
            
            cell.correctAnswerLabel.text = "Correct Answer: \(self.data[indexPath.row].correctanswer!)"
            
            
            if selectedStates.rows.contains(indexPath.row) {

                if selectedStates.buttonTags[indexPath.row] == 0 {
                    //button1
                    cell.button1.backgroundColor = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1)
                    cell.button1.setTitleColor(.white, for: .normal)

                    cell.button1.isUserInteractionEnabled = false
                    cell.button2.isUserInteractionEnabled = false

                    cell.correctAnswerLabel.isHidden = false
                }

                else {
                    //button2
                    cell.button2.backgroundColor = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1)
                    cell.button2.setTitleColor(.white, for: .normal)

                    cell.button1.isUserInteractionEnabled = false
                    cell.button2.isUserInteractionEnabled = false

                    cell.correctAnswerLabel.isHidden = false
                }
            }
        }
        cell.delegate = self
        
        return cell
    }
}
