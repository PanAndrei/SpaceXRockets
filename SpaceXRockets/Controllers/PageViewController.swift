//
//  PageViewController.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 11.04.2022.
//

import UIKit

class PageViewController: UIViewController {

    // MARK: - Properties
    
    // установить програмно
    var pages = 4
    var pageViewController: UIPageViewController?
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageVC()
        setupNavigationVC()
    }
    
    // MARK: - Helpers
    
    func setupPageVC() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController?.dataSource = self
        pageViewController?.delegate = self
        
        let startingVC: MainViewController = viewControllerAtIndex(index: 0)!
        let viewControllers = [startingVC]
        pageViewController?.setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)
        pageViewController?.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        addChild(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController?.didMove(toParent: self)
    }
    
    func setupNavigationVC() {
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
    }
}

// MARK: - UIPageViewControllerDelegate, UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! MainViewController).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! MainViewController).pageIndex

        if (index == NSNotFound) || (index == self.pages - 1) {
            return nil
        }
        
        index += 1
        
        return viewControllerAtIndex(index: index)
    }
    
    func viewControllerAtIndex(index: Int) -> MainViewController? {
        guard index < self.pages else { return nil }

        let pageContentViewController = MainViewController()
        pageContentViewController.pageIndex = index
        
        currentIndex = index
        
        return pageContentViewController
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
