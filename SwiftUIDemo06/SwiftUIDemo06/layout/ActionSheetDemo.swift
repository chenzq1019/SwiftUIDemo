//
//  ActionSheetDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/12.
//

import SwiftUI

struct ActionSheetDemo: View {
    @State var showView: Bool = false
    
    fileprivate func mySheetView() -> ActionSheet {
        return ActionSheet(title:Text("This is Title"),
                           message: Text("This is Message"),
                           buttons:
        [.default(Text("视频"),action: {
            
        }),.default(Text("相册"),action: {
            
        }),.cancel(Text("取消"),action: {
            
        })])
    }
    
    var body: some View {
        Button {
            self.showView = true
        } label: {
            Text("显示一个SheetView")
        }
        .actionSheet(isPresented: $showView) {
            mySheetView()
        }

    }
}

struct ActionSheetDemo_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetDemo()
    }
}
