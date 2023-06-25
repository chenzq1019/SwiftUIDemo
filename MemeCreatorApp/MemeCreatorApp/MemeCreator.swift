//
//  MemeCreator.swift
//  MemeCreatorApp
//
//  Created by 陈竹青 on 2023/6/16.
//

import SwiftUI

struct MemeCreator: View {
    @EnvironmentObject var fetcher: PandaCollectionFetcher
    
    @State private var memeText = ""
    @State private var textSize = 60.0
    @State private var textColor = Color.white
    
    @FocusState private var isFocuesd: Bool
    
    fileprivate func creatBottomBtn() -> some View {
        return HStack{
            Button{
                if let randomImage = fetcher.imageData.sample.randomElement() {
                    fetcher.currentPanda = randomImage
                }
            } label: {
                VStack{
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.largeTitle)
                        .padding(.bottom,4)
                    Text("Shuffle Photo")
                }
                .frame(maxWidth: 180,maxHeight: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button{
                isFocuesd.toggle()
            } label: {
                VStack{
                    Image(systemName: "textformat")
                        .font(.largeTitle)
                        .padding(.bottom, 4)
                    Text("Add Text")
                }
                .frame(maxWidth: 180,maxHeight: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            LoadableImage(imageMetadata: fetcher.currentPanda)
                .overlay (alignment: .bottom){
                    TextField("Meme Text",
                              text: $memeText,
                              prompt: Text("")
                    )
                    .focused($isFocuesd)
                    .font(.system(size: textSize,weight: .heavy))
                    .shadow(radius: 10)
                    .foregroundColor(textColor)
                    .padding()
                    .multilineTextAlignment(.center)
                }
//                .frame(minWidth: 150)
            Spacer()
            if !memeText.isEmpty {
                VStack{
                    HStack{
                        Text("Font Size")
                            .fontWeight(.semibold)
                        Slider(value: $textSize,in: 20...140)
                    }
                    HStack{
                        Text("Font Color")
                            .fontWeight(.semibold)
                        ColorPicker("Font Color", selection: $textColor).labelsHidden()
                            .frame(width: 124,height: 23,alignment: .leading)
                        Spacer()
                    }
                }
                .padding()
                .frame(maxWidth: 325)
            }
            creatBottomBtn()
       
        }
        .padding()
        .task {
            //The .task modifier defines a task to complete when the view first appears. This is where you’ll call fetcher.fetchData() to retrieve the JSON data.
            try? await fetcher.fetchData()
        }
        .navigationTitle("Meme Creator")
    }
}

struct MemeCreator_Previews: PreviewProvider {
    static var previews: some View {
        MemeCreator().environmentObject(PandaCollectionFetcher())
    }
}
