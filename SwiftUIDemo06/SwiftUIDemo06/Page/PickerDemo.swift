//
//  PickerDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI

struct PickerDemo: View {
    @State var selected : String = "女"
    @State private var date = Date()
    var dateFormate:DateFormatter {
        let dateForamet = DateFormatter()
        dateForamet.dateFormat = "yyyy-MM-dd"
//        dateForamet.dateStyle = .short
        return dateForamet
    }
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    var sexs:[String] = ["男","女"]
    var body: some View {
        VStack {
            Text("性别：\(self.selected)")
            Picker("性别", selection: $selected) {
                ForEach(sexs,id: \.self) { sex in
                    Text(sex)
                }
            }.frame(width: 200).pickerStyle(.automatic)
            
            Text("日期\(dateFormate.string(from: date))")
            DatePicker(
                   "",
                    selection: $date,
                    in: dateRange,
                   displayedComponents: [.date,.hourAndMinute]
            ).datePickerStyle(.wheel)
        }
        
      

    }
}

struct myDateModify:DatePickerStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        Text("myDateMofify")
    }
}

struct PickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        PickerDemo()
    }
}
