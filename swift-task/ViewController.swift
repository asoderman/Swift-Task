
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    var taskManager: TaskManager?
    
    override func loadView(){
        
        view = UIView(frame: UIScreen.mainScreen().bounds)
        
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        var barAddButton = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: Selector("callAddView"))
        navigationItem.setRightBarButtonItem(barAddButton, animated: true)
        
        navigationItem.title = "Tasks"
        
        tableView = UITableView(frame: view.bounds)
        tableView!.delegate = self
        tableView!.dataSource = self
        view.addSubview(tableView)
        
        taskManager = TaskManager()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDatasource Below
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return taskManager!.tasks.count
        
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: taskManager!.tasks[indexPath.row].name)
        cell.textLabel.text = taskManager!.tasks[indexPath.row].name
        cell.detailTextLabel.text = taskManager!.tasks[indexPath.row].desc
        
        return cell
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            
            var index = indexPath.row
            taskManager!.removeTask(index)
            tableView.reloadData()
            
        }
    }
    
    func callAddView(){
        
        let addView = SecondViewController(taskManager: taskManager!)
        navigationController.pushViewController(addView, animated: true)
        
    }


}
