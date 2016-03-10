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
    
    public var backgroundImageView = UIImageView()
    
    private var currentPageNumber = 0
    
    public func backgroundImages() -> [UIImage]? {
        return nil
    }
    
    public func numberOfPages() -> Int {
        return 2
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()
        
        setupContentView()
        
        setupConstraints()
    }
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setBackgroundImage()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UI Setup
    
    private func setupScrollView() {
        
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSizeMake(CGFloat(numberOfPages()) * view.frame.width, view.frame.height) //content size height = view height, content size width = numberOfPages * view width.
        
        self.view.addSubview(scrollView)
        scrollView.frame = self.view.bounds
        scrollView.backgroundColor = UIColor.clearColor()
    }
    
    private func setupContentView() {
        
        scrollView.addSubview(contentView)
        contentView.backgroundColor = UIColor.clearColor()
        self.view.backgroundColor = UIColor.whiteColor()
        
        setupBackgroundImageView()
        
    }
    
    private func setupBackgroundImageView() {
        
        self.backgroundImageView = UIImageView(frame: self.view.frame)
        self.backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(backgroundImageView)
        
    }
    
    private func setupConstraints() {
        
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
    
    // MARK: - Data Setters
    
    private func setBackgroundImage() {
        
        let currentPage = getPageNumber()
        
        if let images = backgroundImages() {
            if currentPage < images.count {
                print("currentPage: \(currentPage), imageCount: \(images.count)")
                let currentImage = images[Int(currentPage)]
                
                UIView.transitionWithView(self.backgroundImageView, duration: 0.4, options: .TransitionCrossDissolve, animations: {
                    self.backgroundImageView.image = currentImage
                }, completion: nil)
                
            }
        }
        
    }
    
    // MARK: - UIScrollView Delegate
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        if getPageNumberChanged() {
            setBackgroundImage()
        }
    }
    
    // MARK: - Status Bar
    
    public override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: - Utilities
    
    private func getPageNumber() -> Int {
        return Int(abs(ceil(scrollView.contentOffset.x / scrollView.frame.size.width)))
    }
    
    private func getPageNumberChanged() -> Bool {
        if currentPageNumber != getPageNumber() {
            currentPageNumber = getPageNumber()
            return true
        }
        return false
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
