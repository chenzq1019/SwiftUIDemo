//
//  Profile.swift
//  SwiftUIDemo04
//
//  Created by 陈竹青 on 2023/6/2.
//

import Foundation

struct Profile{
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
   //反引号允许在无法使用的地方使用受限制的关键字，例如变量名default 是保留关键字，不加的话会报错。
    static let `default` = Profile(username: "g_kumar")

        enum Season: String, CaseIterable, Identifiable {
            case spring = "🌷"
            case summer = "🌞"
            case autumn = "🍂"
            case winter = "☃️"

            var id: String { rawValue }
        }
}
