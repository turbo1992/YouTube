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
import HandyJSON

class TrendingViewController: BaseViewController {
    
    let menuTitles = ["hqdefault", "hqdefault-6", "What Does Jared Kushner Believe?", "hqdefault-6", "hqdefault-1", "Cnn:the age channage"]
    
    var articleList: [ArticleInfo]!
    var tableview : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setupTableView()
        getArticleList()
    }
    
    @objc func refreshData() {
        getArticleList()
    }
    
    func getArticleList() {
        HttpClient.GetArticleList(success: { (data) in
            let json = JSON(data)
            print(json)
            let articleModel = JSONDeserializer<ArticleModel>.deserializeFrom(json: json.description)
            if (articleModel?.code == Retcode.SUCCESS.rawValue) {
                self.articleList = articleModel?.data?.list
            } else {
                self.showDetailHint(hint: Tip.REQUEST_FAILED.rawValue)
            }
            self.reloadTable()
        }) { (errorCode, message) in
            print(errorCode as Any, message)
        }
    }
    
    func reloadTable() {
        self.tableview!.mj_header!.endRefreshing()
        self.tableview!.reloadData()
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
        if (self.articleList != nil) {
            let article = self.articleList![indexPath.row]
            cell.setArticle(article: article)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleList == nil ? 0 : self.articleList!.count
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
