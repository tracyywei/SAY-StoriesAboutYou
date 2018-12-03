//
//  SurveyMonkey.h
//  SAY Houston
//
//  Created by Tracy Wei on 8/14/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

#ifndef SurveyMonkey_h
#define SurveyMonkey_h

#import <SurveyMonkeyiOSSDK/SurveyMonkeyiOSSDK.h>

@property (nonatomic, strong) SMFeedbackViewController * feedbackController;
_feedbackController = [[SMFeedbackViewController alloc] initWithSurvey:{XBMLJJP}];
_feedbackController.delegate = self;

- (void)respondentDidEndSurvey:(SMRespondent *)respondent error:(NSError *) error {
    if (respondent != nil) {
        SMQuestionResponse * questionResponse = respondent.questionResponses[0];
        NSString * questionID = questionResponse.questionID;
        if ([questionID isEqualToString:FEEDBACK_QUESTION_ID]) {
            SMAnswerResponse * answerResponse = questionResponse.answers[0];
            NSString * rowID = answerResponse.rowID;
            if ([rowID isEqualToString:FEEDBACK_FIVE_STARS_ROW_ID] || [rowID isEqualToString:FEEDBACK_FOUR_STARS_ROW_ID]) {
                [_statusLabel setText:@"Thanks! Please rate us in the app store!"];
            }
            else {
                [_statusLabel setText:@"Thanks for taking our survey!"];
            }
        }
    }
    else {
        NSLog(@"%@", error.description);
    }
    
}

#endif /* SurveyMonkey_h */
