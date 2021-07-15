import UIKit

class ViewController: UITableViewController {
    var ShoppingList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToShoppingList))
        title="My shopping list"
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "List",for: indexPath)
        cell.textLabel?.text = ShoppingList[indexPath.row]
        return cell
    }
    @objc func addToShoppingList() {
        let ac = UIAlertController(title: "Add item to shopping list", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let addItem = UIAlertAction(title: "Submit", style: .default) {
            [weak ac, weak self] action in
            guard let item = ac?.textFields?[0].text else { return }
            self?.add(item)
        }
        ac.addAction(addItem)
        present(ac, animated: true)
    }
    func add(_ shoppingListItem: String){
        ShoppingList.insert(shoppingListItem, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

