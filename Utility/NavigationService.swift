//
//  NavigationService.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 11/19/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//
import  UIKit
import Foundation
class NavigationService : UIViewController {
    static func navigateToAuthentication(_ viewController : UIViewController) {
          let storyBoard: UIStoryboard = UIStoryboard( name: "Main" , bundle: nil)
          let webViewer = storyBoard.instantiateViewController(withIdentifier: "UserAuthenticationViewController") as! UserAuthenticationViewController
          viewController.present(webViewer, animated: true, completion: nil)
      }
    
    static func navigateToMainSpendingPage(_ viewController : UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard( name: "SpendingRecord" , bundle: nil)
        let webViewer = storyBoard.instantiateViewController(withIdentifier: "MainTabViewController") as! MainTabViewController
        viewController.present(webViewer, animated: true, completion: nil)
    }
    static func navigateToAddItemPage(_ viewController : UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard( name: "SpendingRecord" , bundle: nil)
        let webViewer = storyBoard.instantiateViewController(withIdentifier: "NewRecordViewController") as! NewRecordViewController
        let destinationNavigationController = storyBoard.instantiateViewController(withIdentifier: "Nav1") as! UINavigationController
        destinationNavigationController.pushViewController(webViewer, animated: true)
        viewController.present(destinationNavigationController, animated: true, completion: nil)

       // viewController.present(webViewer, animated: true, completion: nil)


    }
    static func navigateToSignIn(_ viewController : UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard( name: "Main" , bundle: nil)
        let webViewer = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        viewController.present(webViewer, animated: true, completion: nil)
    }
}

