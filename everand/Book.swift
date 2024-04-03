//
//  Book.swift
//  everand
//
//  Created by Indu Pandey on 29/03/24.
//

import Foundation
import SwiftUI

// Define the Book object
struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let coverImage: String
    let type: BookType
    let rating: Double
}

// Define the BookType enum to represent Ebook and Audiobook
enum BookType {
    case ebook
    case audiobook
}

// Sample real-life eBooks with thumbnail image links and ratings
let sampleEbooks: [Book] = [
    Book(title: "1984", author: "George Orwell", coverImage: "https://covers.openlibrary.org/b/id/7222246-L.jpg", type: .ebook, rating: 4.5),
    Book(title: "To Kill a Mockingbird", author: "Harper Lee", coverImage: "https://covers.openlibrary.org/b/id/8958652-L.jpg", type: .ebook, rating: 4.7),
    Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", coverImage: "https://covers.openlibrary.org/b/id/7222246-L.jpg", type: .ebook, rating: 4.3),
    Book(title: "The Catcher in the Rye", author: "J.D. Salinger", coverImage: "https://covers.openlibrary.org/b/id/7222246-L.jpg", type: .ebook, rating: 4.1),
    Book(title: "Pride and Prejudice", author: "Jane Austen", coverImage: "https://covers.openlibrary.org/b/id/7222246-L.jpg", type: .ebook, rating: 4.9)
]

// Sample real-life Audiobooks with thumbnail image links and ratings
let sampleAudiobooks: [Book] = [
    Book(title: "The Hobbit", author: "J.R.R. Tolkien", coverImage: "https://covers.openlibrary.org/b/id/7222246-L.jpg", type: .audiobook, rating: 4.6),
    Book(title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", coverImage: "https://covers.openlibrary.org/b/id/8958652-L.jpg", type: .audiobook, rating: 4.8),
    Book(title: "The Girl with the Dragon Tattoo", author: "Stieg Larsson", coverImage: "https://covers.openlibrary.org/b/id/7222246-L.jpg", type: .audiobook, rating: 4.4),
    Book(title: "The Hunger Games", author: "Suzanne Collins", coverImage: "https://covers.openlibrary.org/b/id/7222246-L.jpg", type: .audiobook, rating: 4.2),
    Book(title: "Gone Girl", author: "Gillian Flynn", coverImage: "https://covers.openlibrary.org/b/id/7222246-L.jpg", type: .audiobook, rating: 4.7)
]
