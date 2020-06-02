//
//  TrendingViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
import SwiftyJSON

class TrendingViewController: BaseViewController {
    
    let menuTitles = ["hqdefault", "hqdefault-6", "What Does Jared Kushner Believe?", "hqdefault-6", "hqdefault-1", "Cnn:the age channage"]
    
    var articleList: NSMutableArray?
    var tableview : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        articleList = NSMutableArray()
        
        setupTableView()
        getArticleList()
    }
    
    @objc func refreshData() {
        getArticleList()
    }
    
    func getArticleList() {
        let urlStr = baseUrl + "/v1/public/articleList"
        request(urlStr).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                
                let res = JSON(json)
                
                for idx in 0...4 {
                    let article = ArticleData()
                    article.title = self.menuTitles[idx]
                    article.coverImgUrl = self.menuTitles[idx]
                    article.authUrl = "channel" + String(idx)
                    self.articleList?.add(article)
                }
                
                print(res)
                print(json)
                
                // 上拉刷新
                let footer = MJRefreshAutoNormalFooter()
                footer.setRefreshingTarget(self, refreshingAction: #selector(self.refreshData))
                self.tableview!.mj_footer = footer
                
                self.tableview!.reloadData()
                self.tableview!.mj_header!.endRefreshing()
                self.tableview!.mj_footer!.endRefreshing()
                
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
        }
    }
    
    private func setupTableView() {
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: MainScreenHeight - NavBarHeight - TabBarHeight), style: UITableView.Style.grouped)
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.register(VedioCell.self, forCellReuseIdentifier: "VedioCell")
        tableview?.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview?.sectionHeaderHeight = 0
        tableview?.sectionFooterHeight = 0
        view.addSubview(tableview!)
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.1))
        tableview?.tableHeaderView = headerView
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.1))
        tableview?.tableFooterView = footerView
        
        // 下拉刷新
        let header = MJRefreshNormalHeader()
        header.setRefreshingTarget(self, refreshingAction: #selector(self.refreshData))
        self.tableview!.mj_header = header
    }
    
}

extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VedioCell", for:indexPath) as! VedioCell
        let article = self.articleList![indexPath.row] as! ArticleData
        cell.vedioImageView.image = UIImage(named: article.coverImgUrl)
        cell.logoImageView.image = UIImage(named: article.authUrl)
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = "2020/05/29"
        cell.timeLabel.text = "01:02"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleList!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MainScreenWidth * 0.6 + 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
