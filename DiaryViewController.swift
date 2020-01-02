//
//  DiaryViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/16/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    @IBOutlet weak var diaryview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurePageViewController()
    }
    var currentPageViewIndex   : Int = 0
    private var diaryDataSource : [String]   = ["[Page One ]","[Page Two ]","[Page Three]"]
    

    
    @IBAction func saveBarItemBttn(_ sender: Any) {
        NavigationService.navigateToMainSpendingPage(self)
    }
    
    @IBAction func closeBarItemBttn(_ sender: Any) {
    NavigationService.navigateToMainSpendingPage(self)
    }
    func configurePageViewController ()
    {
        guard let bookPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "DiaryPageviewController") as? UIPageViewController else { return }
        
        //Assign delegate & diaryDataSource
        bookPageViewController.delegate = self
        bookPageViewController.dataSource = self
        
        //AddpageViewcontroller as a child of the main viewcontroller
        addChild(bookPageViewController)
        
        //Notify pageviewcontroller that it has been added to the parent
        bookPageViewController.didMove(toParent: self)
        
        //make sure the content fit the window e.g turn auto resize = false
        bookPageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        bookPageViewController.view.backgroundColor = UIColor.white
        diaryview.addSubview(bookPageViewController.view)
        bookPageViewController.view.frame = CGRect(x: 0,
                                                   y: 0,
                                                   width: diaryview.frame.width, height: diaryview.frame.height)
        
        //Set the apperance of the dots
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = UIColor.red
        appearance.currentPageIndicatorTintColor = UIColor.black
        
        //Assing the first viewcontroller
        guard let firstPageViewController = detailViewControllerAt(currentPageViewIndex) else{  return }
        bookPageViewController.setViewControllers([firstPageViewController], direction: .forward, animated: true)
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
             let dataViewController = viewController as? DiaryContentViewController
             var currentIndex = dataViewController!.index
             currentPageViewIndex = currentIndex
             
             if currentIndex == 0 { return nil }
             currentIndex -= 1
             return detailViewControllerAt(currentIndex)
         }
         
       var identifiers: NSArray = ["DiaryContentViewController", "DiaryContentViewController"]

       
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
             let dataViewController = viewController as? DiaryContentViewController
           
           let identifier : String = viewController.restorationIdentifier ?? "DiaryContentViewController"
           print ("THe value of the current Idenfitifer : \(identifier)")
           var currentIndex = identifiers.index(of: identifier)

                  //if the index is the end of the array, return nil since we dont want a view controller after the last one
                 /* if index == identifiers.count - 1 {

                      return nil
                  }*/

                  //increment the index to get the viewController after the current index
             //     self.index = self.index + 1
                //  return self.viewControllerAtIndex(self.index)
           
           
          // var currentIndex = dataViewController!.index
             if currentIndex == diaryDataSource.count {  return nil }
             currentIndex = currentIndex + 1//default
             currentPageViewIndex = currentIndex
             return detailViewControllerAt(currentIndex)
         }
         
       //instantiate new instance of view controller assign value and send it TO ACCNUMDataViewController.
          func detailViewControllerAt( _ i : Int) -> UIViewController? { //CoverageDetailViewController?
              
              //to prevent over step the array
              if i >= diaryDataSource.count || diaryDataSource.count == 0 {
                  return nil
              }
           
           if i == 0
           {
                guard let dataViewController = self.storyboard?.instantiateViewController(withIdentifier: "DiaryContentViewController") as? DiaryContentViewController //CoverageDetailViewController
                    else {
                        return nil
                    }
                dataViewController.index = i
                return dataViewController
               
           } else {
               //Not the book cover, so return the normal page
               guard let dataViewController = self.storyboard?.instantiateViewController(withIdentifier: "DiaryContentViewController") as? DiaryContentViewController //CoverageDetailViewController
                   else {
                       return nil
                   }
               dataViewController.index = i
               return dataViewController
           }
              
          }
       
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
