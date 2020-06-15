//
//  TrendingLineViewModel.swift
//  YouTube
//
//  Created by Turbo on 2020/6/5.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

typealias AddDataBlock = () ->Void

class TrendingLineViewModel: NSObject {
    var lineList: Array<TrendingLineData> = Array()
    var updataBlock: AddDataBlock?
}

extension TrendingLineViewModel {
    
    func requestData() {
        for idx in 0...9 {
            var lineData = TrendingLineData()
            lineData.logo_url = "channel" + String(idx)
            lineData.user_name = "Fulymes"
            lineData.time = "2020-06-05 16:23"
            lineData.line_pics = []
            lineData.line_des = "Give more than you planned to. We are not the beginning of the pursuit of others, but every unknown tomorrow."
            if (idx == 2) {
                lineData.user_name = "Va Spint Reicve"
            }
            if (idx == 1 || idx >= 8) {
                lineData.user_name = "TimQ"
                lineData.line_pics = ["channel2", "channel3", "channel4", "channel0", "channel8"]
                if (idx == 8) {
                    lineData.user_name = "DoctorXisle"
                    lineData.line_pics = ["channel6", "channel1"]
                }
                lineData.line_des = "What Does Jared Kushner Believe? \nHe is the biggest flow!! Cow!!"
            }
            self.lineList.append(lineData)
        }
        self.updataBlock?()
    }
    
    func numberOfRowsInSection(section: NSInteger) -> NSInteger {
        return self.lineList.count
    }
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        let picNum = self.lineList[indexPath.row].line_pics?.count ?? 0
        var num:CGFloat = 0
        if picNum > 0 && picNum <= 3 {
            num = 1
        } else if picNum > 3 && picNum <= 6{
            num = 2
        } else if picNum > 6{
            num = 3
        }
        let OnePicHeight = CGFloat((MainScreenWidth - 30) / 3)
        let picHeight = num * OnePicHeight
        let line_des = String(self.lineList[indexPath.row].line_des!)
        let desHeight = GetHeightForText(text: line_des, fontSize: 13, width: MainScreenWidth-30)
        return 80 + picHeight + desHeight + 10
    }
}
