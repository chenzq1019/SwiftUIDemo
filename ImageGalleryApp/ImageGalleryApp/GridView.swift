//
//  GridView.swift
//  ImageGalleryApp
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var dataModel: DataModel
    
    private static let initialColumns = 3
    @State private var isAddingPhoto = false
    @State private var isEditing = false
    @State private var gridColumns = Array(repeating: GridItem(), count: initialColumns)
    @State private var numColumns = initialColumns
    
    private var columnsTitle: String{
        gridColumns.count > 1 ? "\(gridColumns.count) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack{
            if isEditing {
                Stepper(columnsTitle,value: $numColumns, in: 1...6, step: 1){_ in
                    withAnimation {
                        gridColumns = Array(repeating: GridItem(.flexible()), count: numColumns)
                        
                    }
                }.padding()
            }
            ScrollView{
                LazyVGrid(columns: gridColumns) {
                    ForEach(dataModel.items) { item in
                        GeometryReader(){ geomery in
                            NavigationLink {
                                DetailView(item: item)
                            } label: {
                                GridItemView(size: geomery.size.width, item: item)
                            }
                        }
                        .cornerRadius(8)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(alignment: .topTrailing) {
                            if isEditing {
                                Button{
                                    withAnimation {
                                        dataModel.removeItem(item)
                                    }
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                        .font(Font.title)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white,.red)
                                }
                                .offset(x:7,y: -7)
                            }
                        }
                    }
                }.padding(10)
            }
        }
        .navigationTitle("Image Gallery")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingPhoto) {
            PhotoPicker()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    isAddingPhoto = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView().environmentObject(DataModel())
    }
}
