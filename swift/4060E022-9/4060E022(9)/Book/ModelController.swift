//
//  ModelController.swift
//  4060E028-Book
//
//  Created by guest1 on 2018/11/21.
//  Copyright © 2018年 dreamplatz. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {
    
    var pageTitle: [String] = []
    var author: [String] = []
    var contentImage: [String] = []
    var material: [String] = []
    var pageData: [String] = []
    
    
    override init() {
        super.init()
        // Create the data model.
        pageTitle = ["不肖之子", "病驢和狼", "斷尾的狐狸", "病人與醫生", "螞蟻與屎殻郎", "青蛙的理想" ]
        author = ["寓言故事001", "寓言故事002", "寓言故事003", "寓言故事004", "寓言故事005", "寓言故事006" ]
        contentImage = ["5-1", "5-2" , "5-3" , "5-4" , "5-5" , "5-6"]
        
        let story1 = loadString("fild001")
        let story2 = loadString("fild002")
        let story3 = loadString("fild003")
        let story4 = loadString("fild004")
        let story5 = loadString("fild005")
        let story6 = loadString("fild006")
        material = [story1, story2, story3, story4, story5, story6]
        var content:Array<String> = []
        for i in 0..<material.count {
            content.append(pageTitle[i] + "|" + author[i] + "|" + contentImage[i] + "|" + material[i])
        }
        pageData = [content[0], content[1], content[2], content[3], content[4], content[5], ]
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        return dataViewController
    }
    
    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func loadString(_ nameOfFile: String) -> String {
        var stringContent = ""
        if let filepath = Bundle.main.path(forResource: nameOfFile, ofType: "txt") {
            do {
                stringContent = try String(contentsOfFile: filepath)
            } catch {
                
            }
        } else{
        }
        return stringContent
    }
}

