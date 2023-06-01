//
//  ContentView.swift
//  SwiftUIDemo03
//
//  Created by 陈竹青 on 2023/5/31.
//

import SwiftUI

struct Todo {
    let id = UUID()
    var name: String = ""
    var categroy: String = ""
}

struct ContentView: View {
    @State private var todos = [
        Todo(name: "Write SwiftUI book", categroy: "work"),
        Todo(name: "Read Bible", categroy: "personnal"),
        Todo(name: "Bring kids out to play", categroy: "family"),
        Todo(name: "Fetch wife", categroy: "family"),
        Todo(name: "Call mum", categroy: "family"),
    ]
    @State private var showAddTodoView = false
    var body: some View {
        NavigationView {
            List{
                ForEach(todos,id:\.id) { (todo) in
                    NavigationLink {
                        VStack{
                            Text(todo.name)
                            Image(todo.categroy).resizable().frame(width: 200,height: 200)
                        }
                    } label: {
                        HStack{
                            Image(todo.categroy).resizable().frame(width: 50,height: 50)
                            Text(todo.name)
                            
                        }
                    }
                }.onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                }.onMove { indices, newOffset in
                    todos.move(fromOffsets: indices, toOffset: newOffset)
                }
            }.navigationBarTitle("Todo Itms")
                .navigationBarItems(leading: Button(action: {
                    self.showAddTodoView.toggle()
                }, label: {
                    Text("Add")
                }).sheet(isPresented: $showAddTodoView, content: {
                    AddTodoView(showAddTodoView: self.$showAddTodoView,todos: self.$todos)
                }),trailing: EditButton())
        }
    }
}

struct AddTodoView: View{
    //通过将showAddTodoView声明为@Binding，我们就声明了它的值将来自其他地方，并将被共享到AddTodoView和其他地方
    @Binding var showAddTodoView: Bool
    @Binding var todos: [Todo]
    @State private var name: String = ""
    @State private var seletedCategory = 0
    var cateogryTypes = ["family","personal","work"]
    var body: some View{
        Text("Add todo").font(.largeTitle)
        TextField("To Do Name", text: $name).textFieldStyle(.roundedBorder).border(.black).padding()
        Text("Select Cateogry")
        Picker("", selection: $seletedCategory) {
            ForEach(0 ..< cateogryTypes.count){
                Text(self.cateogryTypes[$0])
            }
        }.pickerStyle(.segmented)
        Button {
            self.showAddTodoView = false
            todos.append(Todo(name: name,categroy: cateogryTypes[self.seletedCategory]))
        } label: {
            Text("Done")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


