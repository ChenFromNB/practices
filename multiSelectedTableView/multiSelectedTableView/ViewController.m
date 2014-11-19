//
//  ViewController.m
//  multiSelectedTableView
//
//  Created by Chen on 14/11/19.
//  Copyright (c) 2014年 Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIBarButtonItem *editBarButtonItem;
@property (strong, nonatomic) UIBarButtonItem *cancelBarButtonItem;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSArray *stringArray;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _dataArray = [[NSMutableArray alloc] init];
    _stringArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];

    _editBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                       target:self
                                                                       action:@selector(edit:)];
    _cancelBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                         target:self
                                                                         action:@selector(cancel:)];
    self.navigationItem.rightBarButtonItem = _editBarButtonItem;

    //without this, the tableview would make you choose one to delete
    _tableView.allowsMultipleSelectionDuringEditing = YES;

}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_stringArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    cell.textLabel.text = [_stringArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_dataArray addObject:[_stringArray objectAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_dataArray removeObject:[_stringArray objectAtIndex:indexPath.row]];
}

#pragma mark - 

- (void)edit:(id)sender
{
    [_tableView setEditing:YES animated:YES];
    self.navigationItem.rightBarButtonItem = _cancelBarButtonItem;
}

- (void)cancel:(id)sender
{
    [_tableView setEditing:NO animated:YES];
    self.navigationItem.rightBarButtonItem = _editBarButtonItem;
    [_dataArray removeAllObjects];
}

@end
