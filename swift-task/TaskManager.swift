
import UIKit


struct task{
    
    var name = "Unnamed"
    var desc = "Undescribed"
    
}

class TaskManager: NSObject {
    
    // Holds the group of tasks
    var tasks: [task] = []
	
    
    func addTask(name:String, desc:String)->Bool{
        if (name != ""){
            tasks.append(task(name: name, desc: desc))
            return true
        }
        return false
    }
    
    func removeTask(index:Int)->Bool{
        if (index < tasks.count){
            tasks.removeAtIndex(index)
            return true
        }
        return false
    }

}

