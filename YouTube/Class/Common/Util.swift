//
//  Util.swift
//  YouTube
//
//  Created by Turbo on 2020/5/29.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

func RGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}

func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

func UtilImage(imageView: UIImageView, url: String, placeholder: String) {
    imageView.kf.setImage(with: URL(string: url), placeholder: UIImage(named: placeholder), options: nil, progressBlock: nil, completionHandler: nil)
}

func CreateImage(_ color: UIColor?,  height: CGFloat) -> UIImage? {
    let r = CGRect(x: 0.0, y: 0.0, width: 1.0, height: height)
    UIGraphicsBeginImageContext(r.size)
    let context = UIGraphicsGetCurrentContext()
    if let cg = color?.cgColor {
        context?.setFillColor(cg)
    }
    context?.fill(r)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return img
}


func TimeFormat(value: String?) -> String? {
    let string = value
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    var date = dateFormatter.date(from: string ?? "")
    let time = Int(date!.timeIntervalSince1970 / 1)
    date = Date(timeIntervalSince1970: TimeInterval(time))
    dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
    if let date = date {
        return dateFormatter.string(from: date)
    }
    return nil
}

// 时间戳转NSDate
func DateWithLongLong(longlongValue: Int64) -> Date? {
    let value = longlongValue / 1000
    let time = NSNumber(value: value)
    let nsTimeInterval = TimeInterval(time.int64Value)
    let date = Date(timeIntervalSince1970: nsTimeInterval)
    return date
}

// NSDate转时间戳
func SecondsWithDateTime(datetime: Date?) -> Int64 {
    let interval = datetime?.timeIntervalSince1970 ?? 0.0
    let totalSeconds = Int64(interval * 1000)
    return totalSeconds
}

// 时间比较
func CompareDate(aDate: String?, bDate: String?) -> Int {
    var aa = 0
    let dateformater = DateFormatter()
    dateformater.dateFormat = "yyyy-MM-dd HH:mm:ss"
    var dta = Date()
    var dtb = Date()

    if let date = dateformater.date(from: aDate ?? "") {
        dta = date
    }
    if let date = dateformater.date(from: bDate ?? "") {
        dtb = date
    }
    let result = dta.compare(dtb)
    if result == .orderedSame {
        //a和b相等
        aa = ComparisonResult.orderedSame.rawValue
    } else if result == .orderedAscending {
        //bDate比aDate大
        aa = ComparisonResult.orderedDescending.rawValue
    } else if result == .orderedDescending {
        //bDate比aDate小
        aa = ComparisonResult.orderedAscending.rawValue
    }
    return aa
}
