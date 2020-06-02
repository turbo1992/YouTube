//
//  HomeViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    let menuTitles = ["What Does Jared Kushner Believe?", "hqdefault-2", "Whoner & losers", "hqdefault-1", "Cnn:the age channage", "hqdefault-6", "What Does Jared Kushner Believe?", "hqdefault-2", "Whoner & losers", "hqdefault-1", "Cnn:the age channage", "hqdefault-6"]
    let logoImages = ["channel1", "channel2", "channel3", "channel4", "channel5", "channel6", "channel1", "channel2", "channel3", "channel4", "channel5", "channel6"]
    let descs = ["Molly   2020-05-26 18:42", "Seeker   2020-05-26 17:01", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", " 2020-05-26 18:42", "Molly   2020-05-26 18:42", "Seeker   2020-05-26 17:01", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", " 2020-05-26 18:42"]
    let times = ["01:52", "03:08", "00:53", "02:15", "03:21", "04:28", "01:52", "03:08", "00:53", "02:15", "03:21", "04:28"]
    
    var tableview : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setupTableView()
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
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
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
        let data = VedioData()
        data.vedioImgUrl = menuTitles[indexPath.row]
        data.title = menuTitles[indexPath.row]
        data.authLogo = logoImages[indexPath.row]
        data.createTime = descs[indexPath.row]
        
        let detail = VedioDetailController()
        detail.vedioData = data
        detail.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
