//
//  ViewController.swift
//  StretchingPicture
//
//  Created by Aleksandr Bolotov on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {
    private let imageHigth: CGFloat = 270
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: imageHigth)
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + imageHigth)

    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            imageView.frame.origin.y = offsetY
            imageView.frame.size.height = -offsetY + imageHigth
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: -offsetY + imageHigth, left: 0, bottom: 0, right: 0)
        }
    }
}
