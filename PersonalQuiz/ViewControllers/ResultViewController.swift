//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultOfAnimalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        setUpLabels()
    }
}

// MARK: - Private Methods
extension ResultViewController {
    
    func setUpLabels() {
        guard let animal = getAnimal() else { return }
        
        resultOfAnimalLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
    
    func getAnimal() -> Animal? {
        let animalType = answersChosen.map { $0.animal }
        let countAnimal = animalType.reduce(into: [:]) { numberOfAnimal, animal in
            numberOfAnimal[animal, default: 0] += 1
        }
        let mostRepeatAnimal = countAnimal.max{$0.value < $1.value }?.key
        return mostRepeatAnimal
        }
        
        
        
        
        
//        Первая попытка, выше постаралась избавиться от повторения кода
//
//        let dogCount = answersChosen.filter { $0.animal == .dog }.count
//        let catCount = answersChosen.filter { $0.animal == .cat }.count
//        let turtleCount = answersChosen.filter { $0.animal == .turtle }.count
//        let rabbitCount = answersChosen.filter { $0.animal == .rabbit }.count
//
//        let mostRepeatAnimal = max(dogCount, catCount, rabbitCount, turtleCount)
//
//        if mostRepeatAnimal == dogCount {
//            return .dog
//        } else if mostRepeatAnimal == catCount {
//            return .cat
//        } else if mostRepeatAnimal == rabbitCount {
//            return .rabbit
//        } else {
//            return .turtle
//        }
    }

