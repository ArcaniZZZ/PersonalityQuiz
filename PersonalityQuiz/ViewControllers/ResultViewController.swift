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
    
    var chosenAnswers: [Answer]! {
        didSet {
            defineTestResults()
        }
    }
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defineTestResults()
        
    }
    
    private func defineTestResults() -> Animal {
        var answersDict: [Animal : Int] = [:]
        var result: Animal
        
        chosenAnswers.forEach {
            if let animal = answersDict[$0.animal] {
                answersDict[$0.animal] = animal + 1
            } else {
                answersDict[$0.animal] = 1
            }
        }
        guard let resultingAnimal = animalsDict.sorted { $0.value > $1.value }.first?.key else { return }
        result = resultingAnimal
        return result
        }
    }







