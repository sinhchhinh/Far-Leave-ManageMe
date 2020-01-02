//
//  PlannerMainViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/23/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit
/**PlannerMainViewController Feature:
 1. Display a calendar
 2. Allow user to add new task for a selected date
 3. Allow user to edit an exisiting task
 4. Allow user to view current task
 
 */
class PlannerMainViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var currDisplayDateOutlet: UIButton!
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var calendarView: UIView!
    var currentViewIndex   : Int = 100 //The current page that is displaying in pageviewcontroller
    let dataSource = 200
    var currM : Int!
    var currY : Int!
    var currD : Int!
    static var currMonth : [Int] = []
    let myCalendar = Calendar(identifier: .gregorian)

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    func initUI () {
        /**Create a start date for the current month*/
        let currYMD = myCalendar.dateComponents([.year, .month, .day ,.weekday,  .yearForWeekOfYear], from: Date())
        let tolDaysInCurrMonth = getTolDaysOfMonth(month: currYMD.month!, currYMD.year!)
        currD = currYMD.day!
        currM = currYMD.month
        currY = currYMD.year!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let firstWeekCurrYMD = formatter.date(from: "\(currYMD.year!)/\(currYMD.month!)/01")
        let firstWeek = myCalendar.dateComponents([.year, .month, .day ,.weekday,  .yearForWeekOfYear], from: firstWeekCurrYMD!)
        let monthStr = getMonth(currM)
        
        print ("curr Day : \(firstWeek.weekday)")
        currDisplayDateOutlet.setTitle(" \(currD ?? 0) \(monthStr)  \(currY ?? 0)  ", for: .normal)
        for i in 0...tolDaysInCurrMonth
        {
            if i >= firstWeek.weekday! {
                for j in 1...tolDaysInCurrMonth {
                    PlannerMainViewController.currMonth.append(j)
                    print("Date \(j)")
                }
                break
            } else {
                PlannerMainViewController.currMonth.append(0)
            }
            print("Date \("0")  i: \(i)")
        }
        configurePageViewController()
    }
    @IBAction func submit(_ sender: Any) {
        NavigationService.navigateToMainSpendingPage(self)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        NavigationService.navigateToMainSpendingPage(self)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskcell =  tableView.dequeueReusableCell(withIdentifier: "planneritem", for: indexPath) as! TaskTableViewCell
        tasksTableView.rowHeight = 60
        taskcell.taskTitleLabel.text = "TESTING TITTLE"
        return taskcell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoardNew: UIStoryboard = UIStoryboard( name: "Planner" , bundle: nil)
        let webViewer = storyBoardNew.instantiateViewController(withIdentifier: "NewTaskViewController") as! NewTaskViewController
        self.present(webViewer, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    /**Get the total number of days in a specific month*/
    func getTolDaysOfMonth (month : Int, _ year : Int) -> Int {
        if month % 2 == 0 && month > 2
        {
            return 31
        } else
        {
            switch  month
            {
            case 1:
                return 31
            case 2:
                return 29
//
//                if (year % 100 == 0)
//                {
//
//                    if (year % 400 == 0){
//                        return 29
//                    } else {
//                        return 28
//                    }
//                } else
//                {
//                    return 29
////                    if (year % 4 == 0){
////                        return 29
////                    } else {
////                        return 28
////                    }
//                }
             
            case 7:
                return 31
            default:
                return 30
            }
            
        }
    }
    
    func getMonth (_ month : Int) -> String {
        
        switch month {
        case 1:
            return "January"
        case 2:
            return "Feburary"
        case 3: return "March"
        case 4: return "April"
        case 5: return "May"
        case 6: return "June"
        case 7: return "July"
        case 8: return "August"
        case 9 : return "September"
        case 10 : return "October"
        case 11: return "November"
        case 12: return "December"
        default:
            return ""
        }
    }
    func getDateComponent(year : Int, month : Int ) {
        
        print ("Test curr month: \(month)")
        print ("Test curr year: \(year)")

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let someDateTime = formatter.date(from: "\(year)/\(month)/01")
        print ("value of someDatetime :\(someDateTime)")
        let firstWeek = myCalendar.dateComponents([.year, .month, .day ,.weekday,  .yearForWeekOfYear], from: someDateTime!)
        let monthly = getTolDaysOfMonth(month: firstWeek.month!, firstWeek.year!)
        print (firstWeek)
        print ("Test curr weekday: \(firstWeek.weekday)")
        print ("Test curr total month: \(monthly)")

        // Do any additional setup after loading the view.
        PlannerMainViewController.currMonth.removeAll()
        for i in 0...monthly {
            if i >= firstWeek.weekday! {
                for j in 1...monthly {
                    PlannerMainViewController.currMonth.append(j)
                }
                break
            } else {
                PlannerMainViewController.currMonth.append(0)
            }
        }
        print ("THE TOTAL COUNT OF MONTH:\(PlannerMainViewController.currMonth.count)")
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? PlannerCollectionViewController
        var currentIndex = dataViewController!.indexForPageView
        currentViewIndex = currentIndex
        if currentIndex == 0 {
            return nil }
        currentIndex -= 1
        if currM  == 1 {
            currY = currY - 1
            currM = 12
            getDateComponent(year: currY, month: currM )
        } else {
            currM = currM - 1
            getDateComponent(year: currY, month: currM )
            
        }
        let monthStr = getMonth(currM)
        currDisplayDateOutlet.setTitle("\(currY ?? 0)  \(monthStr)", for: .normal)
        
        return detailViewControllerAt(currentIndex)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! PlannerCollectionViewController
        destinationVC.arrayList = PlannerMainViewController.currMonth
        print ("THe totla count of \(destinationVC.arrayList.count)")
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? PlannerCollectionViewController
        var currentIndex = dataViewController!.indexForPageView
        if currentIndex == dataSource {
            return nil }
        currentIndex = currentIndex + 1
        currentViewIndex = currentIndex
        if currM  == 12 {
            currM = 1
            currY = currY + 1
            getDateComponent(year: currY, month: currM )
        } else {
            currM = currM + 1
            getDateComponent(year: currY, month: currM )
        }
        let monthStr = getMonth(currM)
        currDisplayDateOutlet.setTitle("\(currY ?? 0)  \(monthStr)", for: .normal)
        return detailViewControllerAt(currentIndex)
    }
    /**Process to add the pageviewcontroller into the idcardviewcontroller*/
    func configurePageViewController () {
        //get reference to custom pageviewcontroller
        let storyboardD = UIStoryboard( name: "Planner" , bundle: nil)
        guard let pageViewController = storyboardD.instantiateViewController(withIdentifier: "PlannerPageViewController") as? UIPageViewController
            else { return }
        
        // Assign the deligate and datasource then need to add some required methods
        pageViewController.delegate     = self
        pageViewController.dataSource   = self
        
        //Add the pageViewController as the main view child
        addChild(pageViewController)
        
        //Tell the pageviewcontroller that we added it to the parent
        pageViewController.didMove(toParent: self)
        
        //Make sure the content fit the window
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.backgroundColor = UIColor.white //The background of the dot view
        
        calendarView.addSubview(pageViewController.view)
        
        // Set the page view controller to the contentview size
        pageViewController.view.frame = CGRect(x: 0, y: 0, width: calendarView.frame.width, height: calendarView.frame.height)
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.black
        
        //Get the first viewcontroller
        guard let startingViewController = detailViewControllerAt( currentViewIndex) else{  return }
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true)
    }
    //Display the swipped view controller
    
    func detailViewControllerAt( _ i : Int) -> PlannerCollectionViewController? {
        //to prevent over step the array
        if i >= dataSource || dataSource == 0 {
            return nil }
        print ("value count detailViewControllerAt :\(PlannerMainViewController.currMonth.count)") //issue here
        let currStoryboard = UIStoryboard( name: "Planner" , bundle: nil)
        guard let dataViewController = currStoryboard.instantiateViewController(withIdentifier: "PlannerCollectionViewController") as? PlannerCollectionViewController
            else { return nil }
        
        //Add data to the view
        dataViewController.indexForPageView = i
        //everyswipe the date change
        return dataViewController
    }
    
}
