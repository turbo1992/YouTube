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

class TrendingViewController: BaseViewController, TrendingBackDelegate {
    
    let menuTitles = ["hqdefault", "hqdefault-6", "What Does Jared Kushner Believe?", "hqdefault-6", "hqdefault-1", "Cnn:the age channage"]
    
    var detail: TrendingDetailViewController!
    var articleList: Array<ArticleInfo>!
    var tableview : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articleList = Array()
        createUI()
        getArticleList()
    }
    
    private func setupNavUI(){
        let leftItem = UIBarButtonItem()
        let leftBtn = UIButton()
        leftBtn.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        leftBtn.setImage(UIImage(named: "youtube"), for: UIControl.State.normal)
        leftBtn.setImage(UIImage(named: "youtube"), for: UIControl.State.highlighted)
        leftItem.customView = leftBtn
        self.navigationItem.leftBarButtonItem = leftItem
        
        let image1 = UIImage(named: "photo")
        let rightItem1 = UIBarButtonItem.init(image: image1, style: UIBarButtonItem.Style.plain, target: self, action: #selector(settingAction))
        rightItem1.tintColor = kAppDarkTextColor
        
        let image2 = UIImage(named: "fangdajing")
        let rightItem2 = UIBarButtonItem.init(image: image2, style: UIBarButtonItem.Style.plain, target: self, action: #selector(settingAction))
        rightItem2.tintColor = kAppDarkTextColor
        
        let image3 = UIImage(named: "dian")
        let rightItem3 = UIBarButtonItem.init(image: image3, style: UIBarButtonItem.Style.plain, target: self, action: #selector(settingAction))
        rightItem3.tintColor = kAppDarkTextColor
        
        self.navigationItem.rightBarButtonItems = [rightItem3, rightItem2, rightItem1]
    }
    
    @objc func settingAction() {
        let trendingLine = TrendingLineViewController()
        trendingLine.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(trendingLine, animated: true)
    }
    
    @objc func pushTrendingLine() {
        let trendingLine = TrendingLineViewController()
        trendingLine.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(trendingLine, animated: true)
    }
    
    private func createUI(){
        setupNavUI()
        setupTableView()
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
                for item in Array<ArticleInfo>((articleModel?.data?.list)!) {
                    self.articleList.append(item)
                }
            } else {
                self.showDetailHint(hint: Tip.REQUEST_FAILED.rawValue)
            }
            self.reloadTable()
        }) { (errorCode, message) in
            print(errorCode as Any, message)
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
    
    func reloadTable() {
        self.tableview!.mj_header!.endRefreshing()
        self.tableview!.reloadData()
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
//        detail = TrendingDetailViewController()
//        detail.delegate = self
//        detail.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(detail, animated: true)
        let trendingLine = TrendingLineViewController()
        trendingLine.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(trendingLine, animated: true)
    }
    
    func trendingBack(res: String) {
        print("delegate--->\(res)")
        var article = self.articleList![0]
        article.title = res
        self.articleList!.remove(at: 0)
        self.articleList!.append(article)
        self.reloadTable()
        detail.reLoadUI(color: UIColor.purple) { (msg) in
            print("callback--->\(msg)")
        }
    }
}
