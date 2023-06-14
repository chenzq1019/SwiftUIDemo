//
//  SymboGrid.swift
//  EditingGrids
//
//  Created by 陈竹青 on 2023/6/14.
//

import SwiftUI

struct SymboGrid: View {
    @State private var isAddingSymbol = false
    @State private var isEditing = false
    private static let initialColumns = 3
    @State private var selectedSymbol: Symbol?
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(), count: initialColumns)
    @State private var symbols = [
        Symbol(name: "tshirt"),
        Symbol(name: "eyes"),
        Symbol(name: "eyebrow"),
        Symbol(name: "nose"),
        Symbol(name: "mustache"),
        Symbol(name: "mouth"),
        Symbol(name: "eyeglasses"),
        Symbol(name: "facemask"),
        Symbol(name: "brain.head.profile"),
        Symbol(name: "brain"),
        Symbol(name: "icloud"),
        Symbol(name: "theatermasks.fill"),
    ]
    
    var columnsText: String {
        numColumns > 1 ? "\(numColumns) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack{
            if isEditing {
                Stepper(columnsText, value: $numColumns, in: 1...6, step: 1){_ in
                    withAnimation {
                        gridColumns = Array(repeating: GridItem(.flexible()), count: numColumns)
                    }
                }.padding()
            }
            
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(symbols) { symbol in
                        NavigationLink {
                            SymbolDetail(symbol: symbol)
                        } label: {
                            ZStack{
                                Image(systemName: symbol.name)
                                    .resizable()
                                    .scaledToFit()
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundColor(.accentColor)
                                    .ignoresSafeArea(.container,edges: .bottom)
                                    .cornerRadius(8)
                                
                            }
                            if isEditing{
                                Button {
                                    guard let index = symbols.firstIndex(of: symbol) else { return }
                                    withAnimation {
                                        _ = symbols.remove(at: index)
                                    }
                                } label: {
                                    Image(systemName: "xmark.squre.fill")
                                        .font(.title)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white,Color.red)
                                }

                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("My Symbols")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingSymbol,onDismiss: addSymbol){
            SymbolPicker(symbol: $selectedSymbol)
        }
        .toolbar {
            ToolbarItem {
                Button(isEditing ? "Done" : "Edit"){
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
            ToolbarItem {
                Button {
                    isAddingSymbol = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)

            }
        }
    }
    
    func addSymbol(){
        guard let name = selectedSymbol else { return }
        withAnimation {
            symbols.insert(name, at: symbols.endIndex)
        }
    }
}

struct SymboGrid_Previews: PreviewProvider {
    static var previews: some View {
        SymboGrid()
    }
}
