//
//  GridViewDemo.swift
//  SwiftUIDemo06
//
//  Created by 陈竹青 on 2023/6/12.
//

import SwiftUI

struct GridViewDemo: View {
    
    let columns = Array(repeating: GridItem(), count: 3)
    var emojis = ["🐶","🐱","🐭","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯"]
    var viewModel: EmojiMeoryGame
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0..<viewModel.cards.count){ index in
                        //注意需要设置aspectRatio,否则无法正确获取高度。
                        CardView(card: viewModel.cards[index])
                            .aspectRatio(2/3,contentMode:.fit)
                    }
                }.padding(10)
            }
            
        }.navigationTitle("view")
            .navigationBarTitleDisplayMode(.inline)
    }
    

}

struct CardView : View {
    var card : MemoryGame<String>.Card
    var body: some View{
        //根据父容器大小进行布局，计算字体大小
        GeometryReader { geometry in
            ZStack{
                if card.isFaceup {
                    RoundedRectangle(cornerRadius: DrawingConstents.cornerRadius).stroke(.red)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched{
                    RoundedRectangle(cornerRadius: DrawingConstents.cornerRadius).opacity(0)
                }else{
                    RoundedRectangle(cornerRadius: DrawingConstents.cornerRadius).fill().foregroundColor(.red)
                }
            }
        }
    }
    fileprivate func font(in size: CGSize) -> Font {
        Font.system(size:min(size.width, size.height) * DrawingConstents.fontScale)
    }
    
    fileprivate struct DrawingConstents {
        static let cornerRadius: CGFloat = 10
        static let lineWidht: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}


struct MemoryGame<CardContent> {
    var cards : [Card]
    
    init(numberOfPairs: Int, content: (Int) -> CardContent) {
        self.cards = Array<Card>()
        for index in 0..<numberOfPairs{
            cards.append(Card(content: content(index), id: index * 2))
            cards.append(Card(content: content(index), id: index * 2 + 1))
        }
    }
    
    
    
    
    func choose(card: Card){
        
    }
    
    struct Card: Identifiable {
        var isFaceup : Bool = true
        var isSelected: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


//viewmodel
class EmojiMeoryGame{
    private(set) var modle: MemoryGame<String> = EmojiMeoryGame.creatEmojiGame()
    static func creatEmojiGame() -> MemoryGame<String> {
        let emojis = ["🐶","🐱","🐭","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯"]
        return MemoryGame(numberOfPairs:3){ index in
            emojis[index]
        }
    }

    var cards: Array<MemoryGame<String>.Card> {
        modle.cards
    }

    func choose(card: MemoryGame<String>.Card) {

        modle.choose(card: card)
    }
}


struct GridViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        GridViewDemo(viewModel: EmojiMeoryGame())
//         GridViewDemo()
    }
}
