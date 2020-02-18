//
//  ViewController.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import UIKit
import KVNProgress
import moa

class ViewController: UIViewController {
    
    let viewModel : MovieViewModel = MovieViewModel()
    
    @IBOutlet weak var tableView: UITableView!
        @IBOutlet var detailView: detailsView!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var detailsViewHeight: NSLayoutConstraint!
    @IBOutlet var detailViewInTVHeight: NSLayoutConstraint!
    
    @IBOutlet var detailViewInTV: detailsView!
     @IBOutlet var detailview: UIView!
    
     @IBOutlet var splashScreenView: UIView!
    
    var isRowHidden = false
    
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        removeSplashScreen()

    }
    
    //MARK:- This is what apple says about launch screens The launch screen isn’t an opportunity for artistic expression. It’s solely intended to enhance the perception of your app as quick to launch and immediately ready for use. Every app must supply a launch screen. So i am using an custom view to Show the splash Screen longer i.e 3 seconds
    
    func removeSplashScreen(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.splashScreenView.isHidden = true
            
            self.callAPI()
        }
    }
    
    func callAPI(){
        callMovieApi()
        
        addGesture()
        
//        animateViewHeight(height: 0)
        detailsViewHeight.constant = 0
        detailView.contentView.isHidden = true
        detailViewInTVHeight.constant = 0
        detailViewInTV.contentView.isHidden = true
        
        detailViewInTV.contentView.backgroundColor = UIColor.white
    }
    
    func addGesture(){  //MARK:- Adding Swipe Gesture
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.detailViewInTV.addGestureRecognizer(swipeRight)
        self.tableView.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.tableView.addGestureRecognizer(swipeLeft)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
                configureUI(direction : "Right")
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
                configureUI(direction : "Left")
            default:
                break
            }
        }
    }
    
    func configureUI(direction : String){ //MARK:- Swipe Configuration Code
        if (direction == "Right"){
            segmentControl.selectedSegmentIndex = 0
            isRowHidden = false
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
            detailViewInTVHeight.constant = 0
            detailViewInTV.contentView.isHidden = true
        }
        else{
            if (isSelected){
            segmentControl.selectedSegmentIndex = 1
            isRowHidden = true
            animateViewHeight(height: 200)
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
            }
            else{
                showAlert()
            }
        }
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) { //MARK:- Segment Code
        
        if sender.selectedSegmentIndex == 0{
            isRowHidden = false
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
            detailViewInTVHeight.constant = 0
            detailViewInTV.contentView.isHidden = true
        }
        else{
            if (isSelected){
            isRowHidden = true
            animateViewHeight(height: 200)
            self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
            else{
                segmentControl.selectedSegmentIndex = 0
                showAlert()
            }
        }
        
        
    }
    
    func showAlert(message: String? = "Please select atleast one movie."){   //MARK:- If User has not selected any Movie and trying to move to tab 2
      
       let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnShowDetailsTapped(_ sender: UIButton) { //MARK:- On tap of Show Details button
        
         animateViewHeight(height: 200)
        
        isSelected = true
        
        self.segmentControl.selectedSegmentIndex = 1
        
        isRowHidden = true
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        let selectedData = viewModel.movieData[sender.tag]
        
        self.detailView.movieBanerImgView.moa.url = selectedData.posterPath?.generateMediaURL
        self.detailView.lblTitle.text = selectedData.title
        self.detailView.lblOverview.text = selectedData.overview  //I have used 2 lines to display the overview so that the ui can stay intact
        self.detailView.lblReleaseDate.text = selectedData.releaseDate
        self.detailView.lblRating.text = selectedData.voteAverage?.toString
        
        self.detailViewInTV.lblTitle.text = selectedData.title
        self.detailViewInTV.movieBanerImgView.moa.url = selectedData.posterPath?.generateMediaURL
        self.detailViewInTV.lblOverview.text = selectedData.overview
        self.detailViewInTV.lblReleaseDate.text = selectedData.releaseDate
        self.detailViewInTV.lblRating.text = selectedData.voteAverage?.toString
    }
    
    func animateViewHeight(height : CGFloat){ //MARK:- animation for the view height
        view.layoutIfNeeded()
        detailsViewHeight.constant = height
        detailViewInTVHeight.constant = height
        detailViewInTV.contentView.isHidden = false
        detailView.contentView.isHidden = false

        UIView.animate(withDuration: 0.5, animations: {
             self.view.layoutIfNeeded()
        })
    }
}

//MARK:- Api Calling
extension ViewController{
    func callMovieApi(){
        
        if COMMON_SETTINGS.isConnectedToInternet(){
            KVNProgress.show(withStatus: "Loading", on: self.view)
            viewModel.getMovieList {
                self.tableView.reloadData()
            }
        }
        else{
            showAlert(message : "No Internet connection available")
        }
           
       }

}

//MARK:- Table view delegate, data source and configurations

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviewListTVCell", for: indexPath) as! moviewListTVC
        
        let movieData = self.viewModel.movieData[indexPath.row]
        cell.lblMovieTitle.text = movieData.originalTitle
        cell.movieImgView.moa.url = movieData.posterPath?.generateMediaURL
        cell.btnShowDetails.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (isRowHidden){
            return 0
        }
        else{
            return  100
        }
        
    }
       
}
