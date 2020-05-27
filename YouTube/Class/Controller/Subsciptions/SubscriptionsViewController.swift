//
//  SubscriptionsViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "VedioCell"

class SubscriptionsViewController: BaseViewController {
    
    let menuTitles = ["hqdefault-1", "Whoner & losers", "What Does Jared Kushner Believe?", "hqdefault-2", "Cnn:the age channage", "hqdefault-6"]
    let logoImages = ["channel1", "channel2", "channel3", "channel4", "channel5", "channel5"]
    let descs = ["Molly   2020-05-26 18:42", "Seeker   2020-05-26 17:01", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", " 2020-05-26 18:42"]
    let times = ["01:52", "03:08", "00:53", "02:15", "03:21", "04:28"]
    
    var tableview : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setupTableView()
    }
    
    private lazy var leftBarView: UIView = {
        return UIView(frame: CGRect(x: 0, y: 0, width: 88, height: 44))
    }()
    
    private func setupTableView(){
        tableview = UITableView(frame: view.bounds, style: UITableView.Style.grouped)
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.register(VedioCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableview?.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview?.sectionHeaderHeight = 0
        tableview?.sectionFooterHeight = 0
        view.addSubview(tableview!)
        tableview?.tableHeaderView = SubscripHeaderView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 90))
    }
    
}

extension SubscriptionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for:indexPath) as! VedioCell
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
        return MainScreenWidth*0.6 + 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = VedioData()
        data.vedioImgUrl = menuTitles[indexPath.row]
        data.title = menuTitles[indexPath.row]
        data.authLogo = logoImages[indexPath.row]
        data.createTime = descs[indexPath.row]
        
        let detail = VedioDetailController()
        detail.vedioData = data
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

