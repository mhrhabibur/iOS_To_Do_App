
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var toDos: [String] = []
    
  
    @IBOutlet weak var uiTableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.rowHeight = 50
        
    }
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! TableViewCell
        cell.toDoLable?.text = toDos[indexPath.row]
        
       
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        
        if cell.isChecked == false {
            cell.checkMarkImage.image = UIImage(systemName: "checkmark.circle")
            cell.isChecked = true
        } else {
            cell.checkMarkImage.image = nil
            cell.isChecked = false
            
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let addToDoAlert = UIAlertController(title: "Add To Do", message: "Add a new todo!", preferredStyle: .alert)
        
        addToDoAlert.addTextField()
        
        let addToDoAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let newTodo = addToDoAlert.textFields![0]
            
            if newTodo.text != "" {
                self.toDos.append(newTodo.text!)
                self.uiTableView.reloadData()
            }
            
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        addToDoAlert.addAction(addToDoAction)
        addToDoAlert.addAction(cancelAction)
        
        present(addToDoAlert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            toDos.remove(at: indexPath.row)
            uiTableView.reloadData()
        }
    }
    
    
}

