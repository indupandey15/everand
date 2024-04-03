Pre-interview: SwiftUI coding test
Below is a screenshot of the “Top Charts” screen in the Everand app. This screen displays a scrolling list of Ebooks and Audiobooks.

<img width="303" alt="Screenshot 2024-04-03 at 4 33 42 PM" src="https://github.com/indupandey15/everand/assets/34434023/1de64a7d-a921-43b7-a500-93c58cd5d11c">


The green rectangle is a vertically scrolling list of books (some Ebooks and some Audiobooks). The blue rectangle is a “Formats” button used for filtering based upon Book type.
 
 Tapping the “Formats” button causes a sheet to popup from the bottom of the screen showing options to filter on a particular Book format. After selecting a book format to filter on, the book list updates accordingly.
  <img width="667" alt="Screenshot 2024-04-03 at 4 34 06 PM" src="https://github.com/indupandey15/everand/assets/34434023/c6360cc3-119c-4d09-af3d-f2ddd5555aed">

To Do Pre-Interview You will be given a fixed amount of time to do the following:
● create a new Xcode project to use (for submission upon completion)
● specify how an individual Book object should be represented, with enough attributes to represent everything shown in the list
● construct a sample data model representing a mix of both Ebooks and Audiobooks. The sample data should contain at least enough Books so that the list scrolls.
○ as a suggestion, make up ten sample books (five of each type).
○ the actual book titles, authors, cover images, etc. aren’t important; you can use
actual books or make them up.
● (using SwiftUI) implement a View hierarchy that would end up reproducing the Top Charts screen (specifically, the contents of the blue and green rectangles).
○ Ignore the “Categories” button, no need to implement.
○ Ignore the bottom tab bar, no need to implement.
● tapping the “Formats” button should show the bottom drawer of filter options.
● implement the ability to filter the data model on either Ebooks, Audiobooks, or both. Upon tapping the “Apply” button, the bottom drawer should disappear and the contents of the list should update accordingly.
Interview
During the interview, we will go over your implementation with you, discussing in detail:
● Objects and data model
● SwiftUI View hierarchy
● Debugging
● Performance
