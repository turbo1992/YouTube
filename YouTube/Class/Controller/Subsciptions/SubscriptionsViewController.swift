//
//  SubscriptionsViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class SubscriptionsViewController: BaseViewController {
    
    let menuTitles = ["hqdefault-1", "Whoner & losers", "What Does Jared Kushner Believe?", "hqdefault-2", "Cnn:the age channage", "hqdefault-6"]
    let logoImages = ["channel1", "channel2", "channel3", "channel4", "channel5", "channel5"]
    let descs = ["Molly   2020-05-26 18:42", "Seeker   2020-05-26 17:01", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", " 2020-05-26 18:42"]
    let times = ["01:52", "03:08", "00:53", "02:15", "03:21", "04:28"]
    
    var tableview: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI(){
        setupNavUI()
        setupTableView()
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
    
    private func setupTableView(){
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: MainScreenHeight - NavBarHeight - TabBarHeight), style: UITableView.Style.grouped)
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.register(VedioCell.self, forCellReuseIdentifier: "VedioCell")
        tableview?.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview?.sectionHeaderHeight = 0
        tableview?.sectionFooterHeight = 0
        view.addSubview(tableview!)
        tableview?.tableHeaderView = headerView
        tableview?.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.1))
    }
    
    lazy var headerView: SubscripHeaderView = {
        let header = SubscripHeaderView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 90))
        header.fillAuthData()
        return header
    }()
}

extension SubscriptionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VedioCell", for:indexPath) as! VedioCell
        cell.vedioImageView.image = UIImage(named: menuTitles[indexPath.row])
        cell.logoImageView.image = UIImage(named: logoImages[indexPath.row])
        cell.titleLabel.text = menuTitles[indexPath.row]
        cell.descriptionLabel.text = descs[indexPath.row]
        cell.timeLabel.text = times[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MainScreenWidth * 0.6 + 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data = VedioData()
        data.vedioImgUrl = menuTitles[indexPath.row]
        data.title = menuTitles[indexPath.row]
        data.authLogo = logoImages[indexPath.row]
        data.createTime = descs[indexPath.row]
        
        weak var weakSelf = self
        let detail = VedioDetailController()
        detail.vedioData = data
        detail.end = {(playTime: Int)->() in
            weakSelf!.showDetailHint(hint: "Already Record")
        }
        detail.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

