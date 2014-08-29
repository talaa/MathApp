//
//  DetailoperationsTableViewController.m
//  MathApp
//
//  Created by Tamer Alaa on 8/11/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "DetailoperationsTableViewController.h"
#import "DetailoperationTableViewCell.h"
#import "tempObjects.h"
#import "OperationsViewController.h"
#import "Scorecards.h"

@interface DetailoperationsTableViewController ()
@property(nonatomic,strong) NSArray *tablecontent;
@property (nonatomic,strong)NSMutableArray *usersscore;
@end

@implementation DetailoperationsTableViewController
@synthesize tablecontent;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    tablecontent=[tempObjects tempoarray];
   /*
    NSPredicate *usernamepredicate=[NSPredicate predicateWithFormat:@"username == %@", [tempObjects currentusername]];
    NSPredicate *operationtypepredicate=[NSPredicate predicateWithFormat:@"operationtype == %@",self.title];
    NSPredicate *andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:usernamepredicate,operationtypepredicate,nil]];
    
    
    
    NSArray *ssss = [Scorecards MR_findAllWithPredicate:andPredicate];
    */
    //Scorecards *bghgh=ssss[0];
    
    //NSLog(@"The filtered array is %@  %@  %@",bghgh.operationtype,bghgh.opeerationlevel,bghgh.userscore);
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated{

    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tablecontent count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailoperationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    NSPredicate *usernamepredicate=[NSPredicate predicateWithFormat:@"username == %@", [tempObjects currentusername]];
    NSPredicate *operationtypepredicate=[NSPredicate predicateWithFormat:@"operationtype == %@",self.title];
    NSPredicate *operationlevelpredicate=[NSPredicate predicateWithFormat:@"opeerationlevel == %i",indexPath.row];
    NSPredicate *andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:usernamepredicate,operationtypepredicate,operationlevelpredicate,nil]];
    
    
    
    NSArray *ssss = [Scorecards MR_findAllWithPredicate:andPredicate];
    NSLog(@"The Array is %@",ssss);
    NSString *scorelabel=[[NSString alloc]init];
    NSString *TTF=[[NSString alloc]init];
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    
    [fmt setMaximumFractionDigits:2];
    
    if (ssss.count>0) {
        Scorecards *bghgh=ssss[0];
        scorelabel=[bghgh.userscore stringValue];
        
        TTF=[NSString stringWithFormat:@"Time to Finish: %@ secs",[fmt stringFromNumber:bghgh.timetocomplete]];
    }else{
    scorelabel=@"N/A";
    }
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    if (![def boolForKey:Kshowttf]) {
        TTF=[NSString stringWithFormat:@"Time to Finish: Need to upgrade"];
    }

    // Configure the cell...
    cell.imagetype.image=[UIImage imageNamed:self.title];
    cell.operationtype.text=[tablecontent objectAtIndex:indexPath.row];
    cell.userscore.text=[NSString stringWithFormat:@"Score: %@",scorelabel];
    cell.colorlabel.backgroundColor=[self color];
    
    cell.TTFLabel.text=TTF;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	float r;
	float g;
	float b;
	r=arc4random()%9*.1;
	g=arc4random()%9*.1;
	b=arc4random()%9*.1;
	
	//[cell.col setBackgroundColor:[UIColor colorWithRed:r green:g blue:b alpha:1]];
	//[cell setTextColor:[UIColor whiteColor]];
	[cell.textLabel setTextColor:[UIColor whiteColor]];
	
	
	
    
    
}

-(UIColor*)color{

    float r;
	float g;
	float b;
	r=arc4random()%9*.1;
	g=arc4random()%9*.1;
	b=arc4random()%9*.1;
    UIColor *newcolor=[UIColor colorWithRed:r green:g blue:b alpha:1];
    return newcolor;

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexpath=[self.tableView indexPathForSelectedRow];
    if ([[segue identifier] isEqualToString:@"operationsegue"]) {
        //[[segue destinationViewController] setDelegate:self];
        OperationsViewController *detailcontroller=(OperationsViewController*)[segue destinationViewController];
        detailcontroller.title=[NSString stringWithFormat:@"Level %i",indexpath.row+1];
        [tempObjects setoperationtype:self.title];
        [tempObjects setmainindex:indexpath.row];
        //[self presentViewController:detailcontroller animated:YES completion:nil];
        
    }

    
    
    
}
- (IBAction)unwindToA:(UIStoryboardSegue *)segue
{
    //returning to A
    //[self performSegueWithIdentifier:@"back" sender:self];
}

@end
