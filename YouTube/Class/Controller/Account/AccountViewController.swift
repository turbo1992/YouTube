//
//  AccountViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController {
    
    let menuTitles = ["History", "My Videos", "Notifications", "Watch Later"]
    let vedioImages = ["pl-node", "pl-react", "pl-angular", "pl-mongo", "pl-rest", "pl-javascript", "pl-swift"]
    let vedioTitles = ["NodeJS Tutorails", "React development", "Angular 2 Tutorails", "Mongo db", "Rest API Tutorails(Node & Mongo)", "Java Script ES6", "Swift Tutorails"]
    
    var header: AccountHeaderView!
    var tableview : UITableView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.change()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
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
    
    private func setupTableView(){
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: MainScreenHeight - NavBarHeight - TabBarHeight), style: UITableView.Style.grouped)
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.register(AccountCell.self, forCellReuseIdentifier: "AccountCell")
        tableview?.register(AccountVedioInfoCell.self, forCellReuseIdentifier: "AccountVedioInfoCell")
        tableview?.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview?.sectionHeaderHeight = 0
        tableview?.sectionFooterHeight = 0
        view.addSubview(tableview!)
        view.backgroundColor = RGBA(r: 1, g: 1, b: 1, a: 1)
        header = AccountHeaderView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 120))
        tableview?.tableHeaderView = header
        header.logoButton.addTarget(self, action: #selector(changeLogo), for: UIControl.Event.touchUpInside)
        tableview?.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.1))
    }
    
    @objc func changeLogo() {
        self.change()
    }
    
    func change() {
        let num = RandomIntNumber(lower: 0, upper: 9)
        let name = "channel" + String(num)
        header.changeButtonImage(name: name) { (callbackName) in
            print("new logo : \(callbackName)")
        }
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for:indexPath) as! AccountCell
            cell.leftImageView.image = UIImage(named: menuTitles[indexPath.row])
            cell.titleLabel.text = menuTitles[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountVedioInfoCell", for:indexPath) as! AccountVedioInfoCell
            cell.leftImageView.image = UIImage(named: vedioImages[indexPath.row])
            cell.titleLabel.text = vedioTitles[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return menuTitles.count
        }
        return vedioTitles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 50
        }
        return 80
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 1) {
            return 10
        }
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentList = CommentListViewController()
        commentList.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(commentList, animated: true)
    }
}

