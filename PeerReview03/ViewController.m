//
//  ViewController.m
//  PeerReview03
//
//  Created by Firas CHOUACHI on 2/25/20.
//  Copyright © 2020 Firas CHOUACHI. All rights reserved.
//

#import "ViewController.h"
#import"CurrencyRequest/CRCurrencyRequest.h"
#import"CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property(nonatomic) CRCurrencyRequest *req;



@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController
- (IBAction)buttonTapped:(id)sender {
    
    self.convertButton.enabled=NO;
    self.req =[[CRCurrencyRequest alloc]init] ;
    self.req.delegate= self;
    [self.req start];

    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled =YES;
    double inputValue= [self.inputField.text floatValue];
    
    double euroValue = inputValue *currencies.EUR ;
    double jpyValue = inputValue *currencies.JPY ;
    double GBPValue = inputValue *currencies.GBP ;
    
    
        NSString *temp= [NSString stringWithFormat:@"%2.f",euroValue];
    
    self.currencyA.text =temp;
    
    NSString *tem= [NSString stringWithFormat:@"%2.f",jpyValue];
    
    self.currencyB.text =tem;
    
    NSString *te= [NSString stringWithFormat:@"%2.f",GBPValue];
    
    self.currencyC.text =te;
}

@end
