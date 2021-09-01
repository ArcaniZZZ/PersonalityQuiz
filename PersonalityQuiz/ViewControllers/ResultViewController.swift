//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalTypeDeclarationLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    @IBOutlet var navigationBar: UINavigationItem!
    
    var chosenAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimalType()
        navigationBar.hidesBackButton = true
    }
    
    private func showAnimalType() {
        guard let shownAnimalEmoji = defineTestResults()?.rawValue,
              let shownAnimalDescription = defineTestResults()?.definition
        else { return }
        animalTypeDeclarationLabel.text = "Вы - \(shownAnimalEmoji)"
        animalDescriptionLabel.text = shownAnimalDescription
    }
    
    private func defineTestResults() -> Animal? {
        var answersDictionary: [Animal : Int] = [:]
        var result: Animal
        
        chosenAnswers.forEach {
            if let count = answersDictionary[$0.animal] {
                answersDictionary[$0.animal] = count + 1
            } else {
                answersDictionary[$0.animal] = 1
            }
        }
        
        guard let resultingAnimal = answersDictionary
                .sorted(by: { $0.value > $1.value })
                .first?.key
        else { return nil }
        
        result = resultingAnimal
        return result
    }
}







