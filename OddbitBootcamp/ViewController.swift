//
//  ViewController.swift
//  OddbitBootcamp
//
//  Created by Tugus Jonas on 3/9/17.
//  Copyright © 2017 AXDIOSDeveloper. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
   

    var refreshControl : UIRefreshControl = UIRefreshControl()
    var iImage = 1
    
    var arrayMovie : [MovieModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupCollectionView()
        refreshControl.beginRefreshing()
        downloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
            
            
        }
    
    //MARK : - DATA
    func downloadData(){
        Engine.shared.getlistMovie { [weak self] (result, error) in
            guard let strongSelf = self else {return}
            
            strongSelf.refreshControl.endRefreshing()
            
            if let result = result as? [MovieModel]{
                
                strongSelf.arrayMovie = result
                strongSelf.movieCollectionView.reloadData()
                
            }else if let error = error{
                let alert = UIAlertController.init(title: "error", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                
                let okAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okAction)
                
                strongSelf.present(alert, animated: true, completion: nil)
                
            }else{}
        }
    }
    
    
    
    
    
    
    //MARK: - Configure
    func setupCollectionView(){
        
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        movieCollectionView.addSubview(refreshControl)
        
        movieCollectionView.delegate = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        flowLayout.minimumInteritemSpacing = 4
        flowLayout.minimumLineSpacing = 4
        
        let width: CGFloat = (UIScreen.main.bounds.width - 24) / 2
        let height: CGFloat = 130 + ((width/3)*4)
        flowLayout.itemSize = CGSize(width: width, height: height)
        
        movieCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    
        
    }
    
    //MARK: - Action
    func refresh(sender: UIRefreshControl){
        refreshControl.beginRefreshing()
        downloadData()
    }


}



// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MovieViewCell
        
        let movie = arrayMovie[indexPath.item]
        
        
        if let url = movie.imageUrl {
        cell.loadingIndicator.startAnimating()
        cell.movieImageView.sd_setImage(with: url, completed: {
                (image, error, chache, url) in
                
                if error == nil{
                    cell.loadingIndicator.stopAnimating()
                }
            })
        }
        
        
        cell.titleLabel.text = movie.title?.uppercased()
        cell.descLabel.text = movie.overview
        
        
        return cell 
    }
    
    
    
    
}




