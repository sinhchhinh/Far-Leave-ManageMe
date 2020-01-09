//
//  UserAuthenticationViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 11/17/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class UserAuthenticationViewController: UIViewController , UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    @IBOutlet weak var viewContainer: UIView!
    //View after swipe page viewcontroller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? SecAuthViewController
        
        var currentIndex = dataViewController!.index
        currentPageIdx = currentIndex
        if currentIndex == 0 {
            return nil
        }
         currentIndex -= 1 //default
        return detailViewControllerAt(currentIndex)
    }
    
    //View before swipe page viewcontroller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? SecAuthViewController
        
            var currentIndex = dataViewController!.index
            if currentIndex == dataSource.count {
                return nil
            }
            currentIndex = currentIndex + 1//default
            currentPageIdx = currentIndex
            return detailViewControllerAt(currentIndex)
    }
    
    var currentPageIdx : Int = 0 //Current Page Index
    private var dataSource      : [String]    = ["" , "" , ""]

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
        configurePageViewController()
    }
    
    /** Add pageviewcontroller to current view */
    func configurePageViewController () {
        guard let authpageViewController = self.storyboard?.instantiateViewController(withIdentifier: "AuthenticatePageViewController") as? UIPageViewController
            else {
                return
        }
        //Assign delegate & datasource
        authpageViewController.delegate = self
        authpageViewController.dataSource = self
        
        //Viewcontroller add pageviewcontroller as a chid
        addChild(authpageViewController)
        
        //notify pageviewcontroller that it has been added to the parent
        authpageViewController.didMove(toParent: self)
        
        //Make sure the pageviewcontroller fit the size, turn off the autosize
        authpageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        authpageViewController.view.backgroundColor = .red
        
        viewContainer.addSubview(authpageViewController.view)
        authpageViewController.view.frame =
            CGRect(x: 0, y: 0, width: viewContainer.frame.width, height: viewContainer.frame.height)
        
        let dotAppearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        dotAppearance.pageIndicatorTintColor = .blue
        dotAppearance.currentPageIndicatorTintColor = .white
        
        //give the first viewcontroller
        guard let startingViewController = detailViewControllerAt( currentPageIdx) else{
            return
        }
        authpageViewController.setViewControllers([startingViewController], direction: .forward, animated: true)
        
    }
    
    /**Instantiate new instance of view controller assign value and send it to eachviewcontroller in the pageviewcontroller.*/
    func detailViewControllerAt( _ currPageIdx : Int) -> SecAuthViewController? {
        //to prevent outofbound
        if currPageIdx >= dataSource.count || dataSource.count == 0 { return nil }
        guard let dataViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecAuthViewController") as? SecAuthViewController
            else { return nil}
        return dataViewController
        
    }

}
