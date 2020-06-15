//
//  TrendingLineViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/6/5.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class TrendingLineViewController: BaseViewController {
    
    var tableview : UITableView?
    
    lazy var viewModel: TrendingLineViewModel = {
        return TrendingLineViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Trending Line"
        self.setLeftImageNamed(name: "back", action: #selector(popBackController))
        self.setRightImageNamed(name: "more", action: #selector(pushCommentList))

        setupUI()
        loadData()
    }
    
    @objc func pushCommentList() {
        
    }
    
    private func setupUI(){
        setupTableView()
    }
    
    private func setupTableView(){
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: MainScreenHeight - NavBarHeight), style: UITableView.Style.grouped)
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.register(TrendingLineCell.self, forCellReuseIdentifier: "TrendingLineCell")
        tableview?.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview?.sectionHeaderHeight = 0
        tableview?.sectionFooterHeight = 0
        view.addSubview(tableview!)
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.1))
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.1))
        tableview?.tableHeaderView = headerView
        tableview?.tableFooterView = footerView
    }
    
    func loadData() {
        weak var weakSelf = self
        viewModel.updataBlock = {
            weakSelf!.tableview!.reloadData()
        }
        viewModel.requestData()
    }
}

extension TrendingLineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingLineCell", for:indexPath) as! TrendingLineCell
        let lineData = viewModel.lineList[indexPath.row]
        cell.lineData = lineData
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
