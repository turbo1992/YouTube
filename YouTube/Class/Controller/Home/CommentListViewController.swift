//
//  CommentListViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/6/4.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
import SwiftyJSON
import HandyJSON

class CommentListViewController: BaseViewController {
    
    let menuTitles = ["What Does Jared Kushner Believe?", "hqdefault-2", "Whoner & losers", "hqdefault-1", "Cnn:the age channage", "hqdefault-6", "What Does Jared Kushner Believe?", "hqdefault-2"]
    let logoImages = ["channel1", "channel2", "channel3", "channel4", "channel5", "channel6", "channel1", "channel2", "channel3", "channel4", "channel5", "channel6"]
    let descs = ["Molly   2020-05-26 18:42", "Seeker   2020-05-26 17:01", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", " 2020-05-26 18:42", "Molly   2020-05-26 18:42", "Seeker   2020-05-26 17:01", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", "Molly   2020-05-26 18:42", " 2020-05-26 18:42"]
    let times = ["01:52", "03:08", "00:53", "02:15", "03:21", "04:28", "01:52", "03:08", "00:53", "02:15", "03:21", "04:28"]
    
    var tableView : UITableView?
    var commentList = ["We are not the beginning of the pursuit of others, but every unknown tomorrow. ",
                       "Live beautifully， dream passionately， love completely",
                       "For something，we can't understand when we are young but by the time we understand，we are no longer young for we are the champion. \n\n We improve ourselves by victories over ourselves。 There must be contests， and we must win. \n\n Live beautifully， dream passionately， love completely",
                       "I can make it through the rain. I can stand up once again on my own.",
                       "Give more than you planned to. We are not the beginning of the pursuit of others, but every unknown tomorrow. We are not the beginning of the pursuit of others, but every unknown tomorrow. We are not the beginning of the pursuit of others, but every unknown tomorrow.",
                       "We must accept finite disappointment, but we must never lose infinite hope. -- Mattin Luther King.",
                       "For something，we can't understand when we are young but by the time we understand，we are no longer young for we are the champion. \n\n We improve ourselves by victories over ourselves。 There must be contests， and we must win.",
                       "I can make it through the rain. I can stand up once again on my own."
    ]
    
    var imagesArr = [["channel1", "channel2"],
                  [],
                  ["channel1", "channel2", "channel3"],
                  [],
                  [],
                  [],
                  ["channel1", "channel2", "channel3"],
                  []
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Comments"
        self.setLeftImageNamed(name: "back", action: #selector(self.popBackController))
        
        setupUI()
    }
    
    private func setupUI(){
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: MainScreenHeight - NavBarHeight), style: UITableView.Style.grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(CommentListCell.self, forCellReuseIdentifier: "CommentListCell")
        tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView?.sectionHeaderHeight = 0
        tableView?.sectionFooterHeight = 0
        tableView?.estimatedRowHeight = 44.0
        tableView?.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView!)
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.1))
        tableView?.tableHeaderView = headerView
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.1))
        tableView?.tableFooterView = footerView
    }
    
}

extension CommentListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentListCell", for:indexPath) as! CommentListCell
        cell.userLogoImgView.image = UIImage(named: logoImages[indexPath.row])
        cell.commentTitle.text = menuTitles[indexPath.row]
        cell.commentDes.text = commentList[indexPath.row]
        cell.timeLabel.text = "2020-06-04 15:32"
        cell.setImageViews(images: imagesArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}
