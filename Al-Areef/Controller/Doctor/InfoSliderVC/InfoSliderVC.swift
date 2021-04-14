//
//  InfoSliderVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

struct Tutorial {
    let imageName: String
    let summary: String
    let detail: String
}

import UIKit

class InfoSliderVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnSkip: UIButton!
    
    // MARK:- Variables
    let tutorials = [
        Tutorial(imageName: "1", summary: "", detail: "Create your profile to connect with patient instantly"),
        Tutorial(imageName: "2", summary: "", detail: "Join a network of professional consultants"),
        Tutorial(imageName: "3", summary: "", detail: "Share your knowledge"),
        Tutorial(imageName: "4", summary: "", detail: "Learn and Grow")
    ]

    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setPageControl()
        setCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        btnSkip.setBorder(with: .app_Green, 1)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //collectionView.frame = view.bounds
        
    }

    private func setCollectionView() {
        
//        collectionView.register(UINib.init(nibName: String(describing: InfoSliderCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: InfoSliderCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setPageControl() {
        pageControl.currentPage = 0
        pageControl.numberOfPages = tutorials.count
        let image = UIImage.outlinedEllipse(size: CGSize(width: 17.0, height: 17.0), color: .lightGray)
        self.pageControl.pageIndicatorTintColor = UIColor.init(patternImage: image!)
        self.pageControl.currentPageIndicatorTintColor = .lightGray
    }
    
    
    // MARK:- Button Actions
    @IBAction func btnSkipTapped(_ sender : UIButton){
        pushRegistrationStepTwoVC()
    }
    
    @IBAction func pageControlSelectionAction(_ sender: UIPageControl) {
        //move page to wanted page
    }
    
    // MARK:- Push Methods
    private func pushRegistrationStepTwoVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: RegistrationStepTwoVC.self)) as? RegistrationStepTwoVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK:- Custom Methods
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
} //class

extension InfoSliderVC {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { _ in
            
            self.collectionView.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(row: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        })
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let index = Int(x / view.frame.width)
        pageControl.currentPage = index
    }
}

extension InfoSliderVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tutorials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: InfoSliderCell.self), for: indexPath) as? InfoSliderCell else{return InfoSliderCell()}
        
       
        
        let item = tutorials[indexPath.item]
        
        cell.configure(tutorial: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension InfoSliderVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
