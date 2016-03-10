//
//  MCPagingIntroViewController.swift
//  Pods
//
//  Created by Mohonish Chakraborty on 10/03/16.
//
//

import UIKit

public class MCPagingIntroViewController: UIViewController, UIScrollViewDelegate {

    public let scrollView = UIScrollView()
    
    public let contentView = UIView()
    
    public func numberOfPages() -> Int {
        return 2
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()
        
        setupContentView()
        
        setupConstraints()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UI Setup
    
    func setupScrollView() {
        
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSizeMake(CGFloat(numberOfPages()) * view.frame.width, view.frame.height) //content size height = view height, content size width = numberOfPages * view width.
        
        self.view.addSubview(scrollView)
        scrollView.frame = self.view.bounds
        
    }
    
    func setupContentView() {
        
        scrollView.addSubview(contentView)
        
    }
    
    func setupConstraints() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: [], metrics: nil, views: ["scrollView" : scrollView]))
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: [], metrics: nil, views: ["scrollView" : scrollView]))
        
        let scrollViewLeft = NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: 0)
        let scrollViewRight = NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1, constant: 0)
        let scrollViewTop = NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 0)
        let scrollViewBottom = NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([scrollViewLeft, scrollViewRight, scrollViewTop, scrollViewBottom])
        
        let contentViewWidth = NSLayoutConstraint(item: contentView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: CGFloat(numberOfPages()), constant: 0)
        let contentViewHeight = NSLayoutConstraint(item: contentView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([contentViewWidth, contentViewHeight])
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
