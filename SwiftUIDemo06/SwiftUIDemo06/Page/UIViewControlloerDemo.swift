//
//  UIViewControlloerDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/9.
//

import SwiftUI
import UIKit



struct UIViewControlloerDemo: View {
     var title: String = ""
    var body: some View {
        GeometryReader { geometry in
            ControllerPage()
        }
        .navigationTitle("\(self.title)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ControllerPage: UIViewControllerRepresentable{
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) ->  MyViewController {
        let controller = MyViewController()
        controller.tableView.dataSource = context.coordinator
        controller.tableView.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MyViewController, context: Context) {
        
    }
    
    class Coordinator : NSObject,UITableViewDataSource,UITableViewDelegate {
        var contro : ControllerPage
        init(_ controller: ControllerPage) {
            contro = controller
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "Mycell")
            if(cell == nil) {
                cell = UITableViewCell(style: .default, reuseIdentifier: "Mycell")
            }
            cell?.textLabel?.text = "\(indexPath.row)"
       
            return cell!
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("\(indexPath.row)")
        }
    }
    
}



class MyViewController: UIViewController{
    
   lazy var tableView: UITableView = { [unowned self] in
       let tab = UITableView()
        tab.rowHeight = 50
        return tab
    }()
    
    override func viewDidLoad() {
        print("viewDidLoad")
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
}



struct UIViewControlloerDemo_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControlloerDemo(title: "Title")
    }
}
