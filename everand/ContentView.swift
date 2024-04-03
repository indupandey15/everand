//
//  Book.swift
//  everand
//
//  Created by Indu Pandey on 03/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedFilter: [BookType] = []
    @State private var isFilterSheetPresented = false
    @State private var scrollID: Int? = nil // Add state for tracking scroll position
    
    var filteredBooks: [Book] {
        if selectedFilter.isEmpty {
            return sampleEbooks + sampleAudiobooks
        } else {
            return (selectedFilter.contains(.ebook) ? sampleEbooks : []) + (selectedFilter.contains(.audiobook) ? sampleAudiobooks : [])
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all) // Set background color to black
            
            NavigationView {
                ScrollViewReader { proxy in // Wrap the content in ScrollViewReader
                    VStack {
                        Text("The most popular books and audiobooks generating buzz from NYC, critics, and more")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                        
                        // Formats button
                        HStack {
                            Button(action: {
                                isFilterSheetPresented.toggle()
                            }) {
                                HStack {
                                    Text("Formats")
                                        .foregroundColor(.black)
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.black)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                            }
                            Spacer()
                        }
                        .padding(.top, 10)
                        
                        // List of books
                        List(filteredBooks.indices, id: \.self) { index in
                            // Explicitly assign IDs to each row
                            BookRow(book: filteredBooks[index], index: index + 1)
                                .id(index)
                        }
                        .padding(.top, 0)
                        .onChange(of: scrollID) { value in
                            // Scroll to the specified row when scrollID changes
                            withAnimation {
                                proxy.scrollTo(value, anchor: .top)
                            }
                        }
                    }
                    .navigationBarTitle("Top Charts", displayMode: .inline)
                }
            }
            
            if isFilterSheetPresented {
                FilterSheet(selectedFilter: $selectedFilter) {
                    isFilterSheetPresented.toggle()
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
            }
        }
        .onAppear {
            // Ensure that scrollID is set to nil initially
            scrollID = nil
        }
        .preferredColorScheme(.dark) // Set dark theme
    }
}

struct RatingView: View {
    let rating: Double
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}

// Define BookRow
struct BookRow: View {
    let book: Book
    let index: Int
    
    var body: some View {
        HStack {
            Text("\(index)")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.trailing, 8) // Add padding to separate the number from the image
            
            loadThumbnail(urlString: book.coverImage)
                .fixedSize()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(book.title)
                    .foregroundColor(.white)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(book.author)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .lineLimit(3)
                    .truncationMode(.tail)
                
                HStack {
                    RatingView(rating: book.rating)
                }
                
            }
            
            Button(action: {
                // Action for Wishlist/Bookmark button
            }) {
                Image(systemName: "bookmark")
                    .foregroundColor(.white)
                    .padding(0)
            }
            .padding(.leading, 8)
            
            Spacer() // Add spacer to push the bookmark button to the right corner
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
        .padding(.trailing, 8) // Add padding to the right side of the row
    }
}


// Define FilterSheet
struct FilterSheet: View {
    @Binding var selectedFilter: [BookType]
    var applyAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Formats")
                .font(.title)
                .foregroundColor(.white)
            
            CheckboxRow(title: "Ebooks", isChecked: selectedFilter.contains(.ebook)) { isChecked in
                if isChecked {
                    selectedFilter.append(.ebook)
                } else {
                    selectedFilter.removeAll { $0 == .ebook }
                }
            }
            
            CheckboxRow(title: "Audiobooks", isChecked: selectedFilter.contains(.audiobook)) { isChecked in
                if isChecked {
                    selectedFilter.append(.audiobook)
                } else {
                    selectedFilter.removeAll { $0 == .audiobook }
                }
            }
            
            Button(action: {
                selectedFilter.removeAll()
            }) {
                HStack {
                    Text("Clear All")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.red)
                .cornerRadius(8)
            }
            
            Button(action: {
                applyAction()
                
            }) {
                HStack {
                    Text("Apply")
                        .foregroundColor(.black)
                        
                    Spacer()
                }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                    
            }
        }
        .padding()
        .frame(minHeight: 200, maxHeight: 350) // Set the height of the sheet
        .background(Color.black)
    }
}

struct CheckboxRow: View {
    let title: String
    let isChecked: Bool
    let action: (Bool) -> Void
    
    var body: some View {
        Button(action: {
            action(!isChecked)
        }) {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                Spacer()
                if isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                } else {
                    Image(systemName: "square")
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Define a separate function to load the thumbnail image asynchronously
func loadThumbnail(urlString: String) -> some View {
    AsyncImage(url: URL(string: urlString)) { phase in
        // Handle different loading phases
        switch phase {
        case .empty:
            // Placeholder view while loading
            Image(systemName: "book.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
        case .success(let image):
            // Loaded image
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        case .failure(_):
            // Error placeholder
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
        @unknown default:
            // Default placeholder
            Image(systemName: "book.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
        }
    }
}
