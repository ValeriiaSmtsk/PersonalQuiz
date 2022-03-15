//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultOfAnimalLabel: UILabel!
    @IBOutlet var descriptionAnimalLabel: UILabel!
    
    var answersChosen: [Answer] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        setUpLabel()
    }
}

// MARK: - Private Methods
extension ResultViewController {
    
    func setUpLabel() {
        let kindOfAnimal = getAnimal()
        
        resultOfAnimalLabel.text = "ВЫ - \(kindOfAnimal.rawValue)!"
        descriptionAnimalLabel.text = kindOfAnimal.definition
    }
    
    func getAnimal() -> Animal {
        
        let dogCount = answersChosen.filter { $0.animal == .dog }.count
        let catCount = answersChosen.filter { $0.animal == .cat }.count
        let turtleCount = answersChosen.filter { $0.animal == .turtle }.count
        let rabbitCount = answersChosen.filter { $0.animal == .rabbit }.count
        
        let mostRepeatAnimal = max(dogCount, catCount, rabbitCount, turtleCount)
        
        if mostRepeatAnimal == dogCount {
            return .dog
        } else if mostRepeatAnimal == catCount {
            return .cat
        } else if mostRepeatAnimal == rabbitCount {
            return .rabbit
        } else {
            return .turtle
        }
    }
}


