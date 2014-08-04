
import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var taskManager: TaskManager
    var titleField: UITextField!
    var descField: UITextField!
    
    override func loadView() {
        
        view = UIView(frame: UIScreen.mainScreen().bounds)
        
    }
    

    init(taskManager: TaskManager) {
        self.taskManager = taskManager
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let whiteColor = UIColor.whiteColor()
        view.backgroundColor = whiteColor // Fixes animation when transitioning to this View
        
        // Updates the NavigationController accordingly
        navigationItem.title = "Add a Task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("doneButtonTapped"))
        
        // Creates the UITextField for the title
        titleField = UITextField(frame: CGRectMake(40.0, 100.0, 240.0, 34.0))
        titleField.placeholder = "Task Title"
        titleField.borderStyle = UITextBorderStyle.RoundedRect
        titleField.becomeFirstResponder()
        titleField.delegate = self
        self.view.addSubview(titleField)
        
        // Creates the UITextField for the description
        descField = UITextField(frame: CGRectMake(40.0, 175.0, 240.0, 34.0))
        descField.placeholder = "Description"
        descField.borderStyle = UITextBorderStyle.RoundedRect
        descField.delegate = self
        self.view.addSubview(descField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        // Hides keyboard if whitespace is tapped
        self.view.endEditing(true)
    }
    
    func doneButtonTapped() {
        
        if (titleField.text != ""){
            self.view.endEditing(true)
            taskManager.addTask(titleField.text, desc: descField.text)
            navigationController.popViewControllerAnimated(true)
            
        }
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        // Return key behavior -- Moves to next field or hides keyboard depending on context
        
        if (textField.placeholder == titleField.placeholder) {
            descField.becomeFirstResponder()
        }
        
        if (textField.placeholder == descField.placeholder) {
            textField.resignFirstResponder()
        }
        
        return true
    }


}
