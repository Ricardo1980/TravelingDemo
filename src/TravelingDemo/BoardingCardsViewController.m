//
//  BoardingCardsViewController.m
//  TravelingDemo
//
//  Created by Ricardo on 13/9/15.
//  Copyright (c) 2015 Ricardo Ruiz López. All rights reserved.
//

#import "BoardingCardsViewController.h"
#import "DataModel.h"
#import "BoardingCard.h"
#import "BoardingCardCell.h"

static const NSTimeInterval kAnimationDuration=0.75;

@interface BoardingCardsViewController () <UITableViewDataSource>
@property (nonatomic, strong) DataModel *dataModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoLabelTopConstraint;
@end

@implementation BoardingCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataModel=[DataModel new];
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (IBAction)onSortBoardingPassesButtonPressed:(UIButton *)sender {
    
    [self.dataModel applyTopologicalOrder];
    [self.tableView reloadData];
    
    self.infoLabel.text=@"Sorted Trips";
    sender.enabled=NO;
    sender.hidden=YES;
    
    // animate the movement of the info label and table view
    [self.view layoutIfNeeded];
    self.infoLabelTopConstraint.constant=20;
    [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:7 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModel.boardingCards.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BoardingCardCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(BoardingCardCell.class) forIndexPath:indexPath];
    BoardingCard *boardingCard=self.dataModel.boardingCards[indexPath.row];
    cell.tripLabel.text=[NSString stringWithFormat:@"%@: %@ > %@", boardingCard.transport, boardingCard.origin, boardingCard.destination];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BoardingCard *boardingCard=self.dataModel.boardingCards[indexPath.row];
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Information" message:[boardingCard description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

@end
