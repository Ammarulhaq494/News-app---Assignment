//
//  ViewController.swift
//  News App - Avrioc Assignment
//
//  Created by Ammar Ul Haq on 14/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    //IBoutlets
    @IBOutlet weak var tableviewNews: UITableView!
    
    //ViewModel
    var viewModel:NewsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "The News App"
        self.customizeNavigationTitle()
        self.setupTableview()
        self.configuration()
        
        
    }
    
    func customizeNavigationTitle()
    {
        overrideUserInterfaceStyle = .light   
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let textChangeColor = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textChangeColor
        navigationController?.navigationBar.largeTitleTextAttributes = textChangeColor
    }
    
    func setupTableview()
    {
        tableviewNews.dataSource = self
        tableviewNews.delegate = self
    }


}

extension ViewController
{
    func configuration()
    {
        initViewModel()
        observeEvent()
        
    }
    
    func initViewModel()
    {
        viewModel.loadNews()
    }
    
    //Databinding
    func observeEvent()
    {
        viewModel.eventHandler = { [weak self] event in
            
            switch event
            {
            case .loading :
                print("Loading News")
                break
            case .stopLoading:
                print("Stop Loading")
                break
            case .dataLoaded:
                DispatchQueue.main.async {
                    self?.tableviewNews.reloadData()
                }
                
                break
            case .error(let error):
                print(error)
                
                
            }
            
        }
        
    }
    
    func openDetaiView(artical:Artical)
    {
     let detailViewModel = NewsDetailViewModel(artical: artical)
        if let currentRunVC = self.storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController {
            currentRunVC.detailViewModel = detailViewModel
            self.navigationController?.pushViewController(currentRunVC, animated: true)
        }
        
        
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return viewModel.noOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.nooOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! newsCell
        
        let artical = viewModel.news[indexPath.row]
        cell.news = artical
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artical = viewModel.news[indexPath.row]
        self.openDetaiView(artical: artical)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 297
    }
    
}
