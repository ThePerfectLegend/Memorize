////
////  HomeView.swift
////  Memorize
////
////  Created by Nizami Tagiyev on 10.06.2022.
////
//
//import SwiftUI
//
//struct HomeView: View {
//    
//    @StateObject var game: EmojiMemoryGame
//    @EnvironmentObject var theme: ThemeMemoryGame
//    @State var editingTheme: Theme?
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(theme.emojiGameThemes) { gameTheme in
//                    NavigationLink {
//                        EmojiMemoryGameView()
//                            .onAppear {
//                                theme.chosenTheme = gameTheme
//                            }
//                    } label: {
//                        GameThemeRowView(theme: gameTheme)
//                    }
//                    
//                    // Custom Swipe Action
//                    .swipeActions(edge: .trailing) {
//                        Button(role: .destructive) {
//                            theme.delete(theme: gameTheme)
//                        } label: {
//                            Label("Delete", systemImage: "trash")
//                        }
//                        Button {
//                            setEditingTheme(gameTheme)
//                        } label: {
//                            Label("Edit", systemImage: "pencil.circle")
//                        }
//                    }
//                }
//                /// - Bug: Leaving edit mode after finish of moving gesture
//                .onMove(perform: theme.moveTheme)
//                /// - Bug: Fatal error: Unexpectedly found nil while unwrapping an Optional value
////                .sheet(item: $editingTheme, onDismiss: resetEditingTheme) { theme in
////                    EditSheet(forTheme: Binding<theme>)
//                    
////                    if let bindingTheme = Binding<Theme>($editingTheme) {
////                        EditSheet(forTheme: bindingTheme)
////                    }
//                    
////                    EditSheet(forTheme: Binding($editingTheme)!)
//                    
////                    Text(editingTheme?.name ?? "nil")
////                    Button {
////                        print(editingTheme?.name)
////                    } label: {
////                        Text("Print Status")
////                    }
//
////                }
//            }
//            .navigationTitle("Memorize")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    EditButton()
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    addThemeButton
//                }
//            }
//
//            // adding sheed shoud be here
//        }
//        .environmentObject(game)
//    }
//}
//
//extension HomeView {
//    
//    var addThemeButton: some View {
//        Button {
//            print("Sheet should be pop-up here")
//        } label: {
//            Image(systemName: "plus")
//        }
//    }
//    
//    func resetEditingTheme() {
//        editingTheme = nil
//        print("Theme is set to nil")
//    }
//    
//    func setEditingTheme(_ theme: Theme) {
//        editingTheme = theme
//        print("Editing theme set to \(editingTheme?.name ?? "nil")")
//    }
//}
//a
