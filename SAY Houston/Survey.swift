//
//  Survey.swift
//  SAY Houston
//
//  Created by Tracy Wei on 8/3/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import Foundation
import ResearchKit

public var Survey: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Survey"
    instructionStep.text = "The following survey is intended for children only. For data purposes, please don't submit more than one response per person. All answers submitted will not be related to you in any way. All answers will remain anonymous."
    steps += [instructionStep]
    
    //Numeric Input Question
    let zipcodeQuestion = "Please enter your zipcode"
    let zipcodeAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "")
    let zipcodeQuestionStep = ORKQuestionStep(identifier: "ZipcodeStep", title: zipcodeQuestion, answer: zipcodeAnswer)
    steps += [zipcodeQuestionStep]
    
    let gradeQuestionStepTitle = "What is your grade level?"
    let textChoices = [
        ORKTextChoice(text: "K-2", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "3-5", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "6-8", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "9-12", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
    ]
    let gradeAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    let gradeQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: gradeQuestionStepTitle, answer: gradeAnswerFormat)
    steps += [gradeQuestionStep]
    
    let completionStep = ORKCompletionStep(identifier: "SummaryStep")
    completionStep.title = "Thank You!!"
    completionStep.text = "You have completed the survey"
    steps += [completionStep]
    
    return ORKOrderedTask(identifier: "Survey", steps: steps)
}




/*let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
nameAnswerFormat.multipleLines = false
let nameQuestionStepTitle = "What is your name?"
let nameQuestionStep = ORKQuestionStep(identifier: "NameStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
steps += [nameQuestionStep]

//Image Input Question
let moodQuestion = "How do you feel today?"
let moodImages = [
    (UIImage(named: "Happy")!, "Happy"),
    (UIImage(named: "Angry")!, "Angry"),
    (UIImage(named: "Sad")!, "Sad"),
]
let moodChoice : [ORKImageChoice] = moodImages.map {
    return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
}
let answerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: moodChoice)
let moodQuestionStep = ORKQuestionStep(identifier: "MoodStep", title: moodQuestion, answer: answerFormat)
steps += [moodQuestionStep]*/



