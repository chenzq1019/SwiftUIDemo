//
//  PageViewController.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/6/6.
//

import SwiftUI
import UIKit


struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    /**
     Step 2
     Add another method to PageViewController to make the coordinator
     You can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action.
     */
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
//Step 1
 //   Declare a nested Coordinator class inside PageViewController.
    class Coordinator: NSObject,UIPageViewControllerDataSource,UIPageViewControllerDelegate{
        var parent: PageViewController
        var controllers = [UIViewController]()
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            //Initialize an array of controllers in the coordinator using the pages array of views.
            controllers = parent.pages.map{UIHostingController(rootView: $0)}
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
            guard let index = controllers.firstIndex(of: viewController) else{
                return nil
            }
            if index + 1 == controllers.count{
                return controllers.first
            }
            return controllers[index + 1]
        }
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}


