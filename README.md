# NYT-Books-GroupProj

## Description
This app pulls up the most recent New York Times Bestsellers list and has the ability to search for the books with 59 different book genres. You can also save the book to your personal favorites and purchase it through options that include Amazon, Apple, Barnes and Nobles, or a local bookstore near you.

![GroupProjectGif](https://user-images.githubusercontent.com/42211866/74857963-825ef780-5312-11ea-9d80-367c8090c7f1.gif)


## Challenges
The challenging part of the app was piecing together the view controllers and persisting the information throughout the app.

The most insteresting clip of code created was the links button that provides the user fast jumps to purchase their favorite books.

```swift
extension FavoritesViewController: FavoriteDelegate {
    func didFavorite(_ favoriteCell: FavoritesCVC, _ favBook: BookInfo) {
        //delete item
        //see on amazon
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (alertAction) in
            self.didDelete(book: favBook)
        }
        let amazonAction = UIAlertAction(title: "Find on Amazon", style: .default) { (alertAction) in
            guard let amazonURL = favBook.buyLinks.first else {return }
            guard let url = URL(string: amazonURL.url) else { return }
            UIApplication.shared.open(url)
        }
        let appleAction = UIAlertAction(title: "Find on Apple Books", style: .default) { (alertAction) in
            guard let url = URL(string: favBook.buyLinks[1].url) else { return }
            UIApplication.shared.open(url)
        }
        let barnesAction = UIAlertAction(title: "Find on Barnes and Noble", style: .default) { (alertAction) in
            guard let url = URL(string: favBook.buyLinks[2].url ) else { return }
            UIApplication.shared.open(url)
        }
        let localAction = UIAlertAction(title: "Find Locally", style: .default) { (alertAction) in
            guard let url = URL(string: favBook.buyLinks[3].url ) else { return }
            UIApplication.shared.open(url)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(deleteAction)
        alertController.addAction(amazonAction)
        alertController.addAction(appleAction)
        alertController.addAction(barnesAction)
        alertController.addAction(localAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
        
    }
    
    private func didDelete(book: BookInfo) {
        guard let index = books.firstIndex(of: book) else {return}
        
        do {
            //data persistence delete here
            try dataPersistence.deleteItem(at: index)
        } catch {
            print("error deleting item: \(error)")
        }
    }

    
}
```
