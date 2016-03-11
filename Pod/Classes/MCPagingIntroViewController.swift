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
    
    public var pageControl = UIPageControl()
    
    public var loginView = UIView()
    
    private var currentPageNumber = 0
    
    // MARK: - Data Setters
    
    public func numberOfPages() -> Int {
        return 2
    }
    
    public func backgroundImages() -> [UIImage]? {
        return nil
    }
    
    public func detailImages() -> [UIImage]? {
        return nil
    }
    
    public func labelTexts() -> [String]? {
        return nil
    }
    
    // MARK: - View Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()
        setupContentView()
        setupConstraints()
        setupLoginView()
        setupPagingControl()
        setupLabels()
        setupDetailImageViews()
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
        self.view.insertSubview(backgroundImageView, belowSubview: self.scrollView)
        
        setupBackgroundImageGradient()
        
    }
    
    private func setupBackgroundImageGradient() {
        
        let gradientView = UIView(frame: self.backgroundImageView.bounds)
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [UIColor(netHex: 0x45ace1).CGColor, UIColor(netHex: 0x1DE9B6).CGColor]
        gradientView.layer.insertSublayer(gradient, atIndex: 0)
        gradientView.alpha = 0.2
        
        self.view.insertSubview(gradientView, aboveSubview: self.backgroundImageView)
        
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
    
    private func setupLoginView() {
        
        let loginFrame = CGRectMake(0, (self.view.frame.height - 60), self.view.frame.width, 60)
        loginView = UIView(frame: loginFrame)
        loginView.backgroundColor = UIColor(white: 0, alpha: 0.2)
        self.view.insertSubview(loginView, aboveSubview: self.scrollView)
        
        let startButton = UIButton(frame: CGRectMake((loginView.frame.width / 5), (loginView.frame.height / 3), (loginView.frame.width / 1.5), (loginView.frame.height / 2)))
        startButton.setTitle("Get Started", forState: .Normal)
        startButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startButton.layer.cornerRadius = startButton.frame.height / 2
        startButton.clipsToBounds = true
        startButton.backgroundColor = UIColor.clearColor()
        startButton.alpha = 0.8
        startButton.layer.borderColor = UIColor.whiteColor().CGColor
        startButton.layer.borderWidth = 1
        loginView.addSubview(startButton)
        
    }
    
    private func setupPagingControl() {
        
        self.pageControl.frame = CGRectMake(0, self.loginView.frame.origin.y - 30, self.view.frame.width, 20)
        self.view.insertSubview(pageControl, aboveSubview: self.scrollView)
        pageControl.numberOfPages = self.numberOfPages()
        
    }
    
    // MARK: - Detail Labels
    
    private func setupLabels() {
        
        if let labels = labelTexts() {
            var page = 0
            for label in labels {
                setLabelOnPage(label, page: page)
                ++page
            }
        }
        
    }
    
    private func setLabelOnPage(labelText: String, page: Int) {
        
        let labelFrame = CGRectMake(getLabelX(page), self.loginView.frame.origin.y - 100, self.view.frame.width, 40)
        let label = UILabel(frame: labelFrame)
        label.font = UIFont.systemFontOfSize(15)
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        
        label.text = labelText
        
        self.contentView.addSubview(label)
        
    }
    
    private func getLabelX(page: Int) -> CGFloat {
        return CGFloat(page*Int(self.view.frame.width))
    }
    
    // MARK: - Detail ImageViews
    
    private func setupDetailImageViews() {
        
        if let images = detailImages() {
            var page = 0
            for image in images {
                setDetailImageOnPage(image, page: page)
                ++page
            }
        }
        
    }
    
    private func setDetailImageOnPage(image: UIImage, page: Int) {
        
        let imageFrame = CGRectMake(getDetailImageX(page), 150, ((self.loginView.frame.origin.y - 100) - 200), ((self.loginView.frame.origin.y - 100) - 200))
        let imageView = UIImageView(frame: imageFrame)
        imageView.image = image
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.borderWidth = 2.0
        
        self.contentView.addSubview(imageView)
    }
    
    private func getDetailImageX(page: Int) -> CGFloat {
        return CGFloat((page*Int(self.view.frame.width)) + 50)
    }
    
    
    // MARK: - Background Image
    
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
            pageControl.currentPage = getPageNumber()
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
