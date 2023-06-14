//
//  TextDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/8.
//

import SwiftUI

private let github = "https://github.com/Jinxiansen/SwiftUI"
struct TextDemo: View {
    var title: String
    let markdown = "**Bold**regular and _italic_ [hyperlink cool](www.google.com)"
    var attributeStr : AttributedString{
        var str = AttributedString("This is My AttributedStr")
        let rangThis = str.range(of: "This")
        str[rangThis!].font = .system(size: 30)
        let rangMy = str.range(of: "My")
        str[rangMy!].foregroundColor = .red
        let last = str.range(of: "AttributedStr")
        str[last!].underlineStyle = .single
        return str
    }
    var body: some View {
        VStack {
            Text("\(title)")
            Text("SwiftUI")
                .foregroundColor(.orange)//字体颜色
                .font(.system(size: 30))//字体大小
                .shadow(radius: 2)//阴影
                .italic()//斜体
                .bold()//粗体
            Text(github)
                .underline(true,color: .black)//下划线
                .foregroundColor(.black)
                .font(.system(size: 16)).onTapGesture {//点击手势
                    print(github)
                }
            Text("contained no UIScene configuration dictionary (looking for configuration namedcontained no UIScene configuration dictionary (looking for configuration named")
                .lineLimit(2)//行数限制
                .padding()
            Text(makeAttributedString())
            Text(attributeStr)
        }
        
    }
    
    func makeAttributedString() -> AttributedString {
        var string = (try? AttributedString(markdown: markdown)) ?? AttributedString("Error markdown")
        let linkLabels = getLinkLabels(markdownString: markdown)
        for label in linkLabels {
            if let range = string.range(of: label) {
                string[range].foregroundColor = .red
            }
        }
        return string
    }
    func getLinkLabels(markdownString: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: "\\[[a-zA-Z0-9_ ]*\\]") else { return [] }
        let results = regex.matches(in: markdownString,
                                    range: NSRange(markdownString.startIndex..., in: markdownString))
        let labels = results.compactMap {
            Range($0.range, in: markdownString).map { String(markdownString[$0]) }
        }
        // removing the brackets from the link labels before return
        return labels.map { $0.trimmingCharacters(in: CharacterSet(charactersIn: "[]")) }
    }
}

struct TextDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextDemo(title: "Text")
    }
}
