//
//  ConsentTask.swift
//  SAY Houston
//
//  Created by Tracy Wei on 8/14/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //TODO: Add VisualConsentStep
    let consentDocument = ORKConsentDocument()
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    //TODO: Add ConsentReviewStep
    let signature = consentDocument.signatures?.first
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
