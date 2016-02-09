# TableDynamicHeight
## To UITableView auto calculate height of row you should implement two method following:
```swift
  func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      return 65.0//Dumy
  }
    
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
```
Note:
- if you use UILabel then you should change lines to 0 in the attributes inspector
- if you user textView then you should disable vertical scrolling
- Please ensure that you have pined all item around parent view (lead, top, bottom, trail)

## To register event keyboard appear you should implement this code:
```swift
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
  }
    
  func keyBoardWillShow(notification :NSNotification){
    if let frameObject: AnyObject = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]
    {
      let keyboardFrame = frameObject.CGRectValue
      //Move textView here to top of keyboard
    }
  }
```

