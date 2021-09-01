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
    
    private var chosenAnswers: [Answer]!
    private var mostCommonAnimal: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimalType()
        showAnimalDescription()
        navigationBar.hidesBackButton = true
    }
    
    private func showAnimalType() {
        guard let shownAnimalEmoji = defineTestResults()?.rawValue else { return }
        animalTypeDeclarationLabel.text = "Вы - \(shownAnimalEmoji)"
    }
    
    private func showAnimalDescription() {
        guard let shownAnimalDescription = defineTestResults()?.definition else { return }
        animalDescriptionLabel.text = shownAnimalDescription
    }
    
    private func defineTestResults() -> Animal? {
        var answersDict: [Animal : Int] = [:]
        var result: Animal
        
        chosenAnswers.forEach {
            if let count = answersDict[$0.animal] {
                answersDict[$0.animal] = count + 1
            } else {
                answersDict[$0.animal] = 1
            }
        }
        guard let resultingAnimal = answersDict.sorted(by: { $0.value > $1.value }).first?.key else { return nil }
        result = resultingAnimal
        return result
        }
    }







