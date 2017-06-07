//
//  BaseViewController.swift
//  SignDoc
//
//  Created by Suresh Kumar on 07/06/17.
//  Copyright © 2017 Suresh Kumar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // Token to dispatch once...
    private var oneTimeToken = {0}()
    
    //Navigation Items...
    private var leftBarButtonItem : UIBarButtonItem!
    private var rightBarButtonItem : UIBarButtonItem!
    private var navigationLeftButton : UIButton!
    private var navigationRightButton : UIButton!
    
//    public var reachabilityManager : NetworkReachabilityManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initiate the Network Monitoring...
        
//        self.reachabilityManager?.stopListening()
        
        
        self.defaultStylingAndProperties()
        self.setNavigationBarTintColor(color:kBLUE_COLOR)
        
        //Set View's gradient background color
//        DataManager.sharedDataManager.setGradientBackgroundColor(view:self.view);
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Add reachability observer for the current class...
//        self.addreachabilityObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //Remove reachability obser for the current class...
//        self.removeReachabilityObserver()
        
        //Hide activity indicator if exists...
//        DataManager.sharedDataManager.stopActivityIndicator()
        
    }
    
    
    //MARK:- METHODS
    private func defaultStylingAndProperties() {
        
        
        //Navigation - right, left barbuttonitem allocation.
        self.leftBarButtonItem = UIBarButtonItem()
        self.rightBarButtonItem = UIBarButtonItem()
        
        self.setNavigationBackButton()
        self.setNavigationBarSettings()
        
        
    }
    func setNavigationTitle(title : String!) {
        self.title = title
    }
    
    func setNavigationBarColor(color : UIColor) {
        
        self.navigationController?.navigationBar.tintColor = color
    }
    
    func setNavigationBarTintColor(color : UIColor) {
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    //BackButton...
    private func setNavigationBackButton() {
        let viewControllers = (self.navigationController?.viewControllers)! as NSArray
        
        if(viewControllers.count == NUMBER_ONE) {
            return
        }
        if(self.navigationLeftButton == nil) {
            self.navigationLeftButton = UIButton(type: UIButtonType.system)
        }
        
        self.navigationLeftButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.navigationLeftButton.imageEdgeInsets = UIEdgeInsetsMake(15,12,15,12)
        self.navigationLeftButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 10)
        
        let image = UIImage(named: "backArrow")
        let newImage = image?.withRenderingMode(.alwaysTemplate) as UIImage!
        
        self.navigationLeftButton.setImage(newImage, for: .normal)
        self.navigationLeftButton.tintColor = kWHITE_COLOR
        
        
        self.navigationLeftButton.imageView?.contentMode = UIViewContentMode.center
        self.navigationLeftButton.addTarget(self, action: #selector(BaseViewController.backButtonTapped), for: UIControlEvents.touchUpInside)
        self.leftBarButtonItem.customView = self.navigationLeftButton
        self.navigationItem.leftBarButtonItem = self.leftBarButtonItem
    }
    
    
    //Right Button...
    func setTopRightButton(rightButton : UIButton!) {
        self.rightBarButtonItem.customView = rightButton
        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem
        
    }
    
    //Back Button...
    func setTopLeftButton(leftButton : UIButton!) {
        self.leftBarButtonItem.customView = leftButton
        self.navigationItem.rightBarButtonItem = self.leftBarButtonItem
        
    }
    
    //MARK:- Navigaton Action Handlers
    //BackButtonTapped
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    //MARK:- Reachability observer - notifier
    //Add Reachability Observer
//    private func addreachabilityObserver() {
//        self.reachabilityManager = NetworkReachabilityManager(host: "www.apple.com")!
//        
//        self.reachabilityManager?.listener = { status in
//            print("Network Status Changed: \(status)")
//            self.networkChanged(status: status);
//        }
//        
//        self.reachabilityManager?.startListening()
//        
//        
//    }
//    
//    //Remove Rechability Observer
//    private func removeReachabilityObserver() {
//        self.reachabilityManager?.stopListening()
//    }
//    
//    func networkChanged(status : NetworkReachabilityManager.NetworkReachabilityStatus) {
//        
//        if(status == .notReachable) {
//            let alertView = UIAlertView(title: "Network Unavailable!", message: "You're seems to be offline, please connect to a network", delegate: self, cancelButtonTitle: "Ok")
//            alertView.show()
//            
//        }
//    }
    
    
    //MARK:- After DidLayout Actions
    override func viewDidLayoutSubviews() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(BaseViewController.didFinishLayout), object: nil)
        self.perform(#selector(BaseViewController.didFinishLayout), with: nil, afterDelay: 0)
    }
    
    
    //When all subviews finish layout...
    func didFinishLayout() {
        
        //Does nothing, as this method will be overriden in the subclasses, if it is required.
    }
    
    
    
    //MARK:- Navigationbar Settings
    public func setNavigationBarSettings() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16)!, NSForegroundColorAttributeName : kWHITE_COLOR]
        
        //Changes the status bar text color to white, globally...
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        
    }
    

}
