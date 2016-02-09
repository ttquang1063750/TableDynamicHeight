//
//  ViewController.swift
//  TableDynamicHeight
//
//  Created by Thanh Quang Ngoc Tuong on 2/6/16.
//  Copyright © 2016 Thanh Quang Ngoc Tuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var comment: UITextField!
    @IBOutlet var actionView: UIView!
    @IBOutlet var tableView: UITableView!
    
    
    
    var customCell:CustomTableViewCell?
    var frame:CGRect!
    var fontArray:[String]?
    var isShow = true
    var content = ["Set the new label’s Lines (the number of lines the label can have at most) to 0, meaning unlimited.","Tình đời khi trắng khi đen, cười vui mới đó nhưng giờ tưởng chẳng hề wen. Gặp thì ng thờ ơ làm như chẳng biết bao giờ tình nghĩa xưa chỉ còn lời nói hững hờ Cuộc đời khi có cho k rồi khi túng thiếu hỏi người có đòi đc k? Giàu thì nhiều người ng theo quạnh hiu trống vắng khi nghèo Lời nói y thương đành trả lại ng thôi Nhìn cuộc đời trách sao k vừa tay với nhìn lại mình sao tay con đang trắng tay Bao lời y tiếng thương sao giờ xa vời, trong bóng đêm trập trùng ngồi 1 mình thôi Suốt cả đời này biết mấy ai thân Nhiều đêm thức giấc nhớ người tình nhân, còn gì để tặng nhau 1 khi lá đã đổi màu Tình nghĩa mai đem về trong lòng nguyện sâu","Tình đời khi trắng khi đen, cười vui mới đó nhưng giờ tưởng chẳng hề wen. Gặp thì ng thờ ơ làm như chẳng biết bao giờ tình nghĩa xưa chỉ còn lời nói hững hờ Cuộc đời khi có cho k rồi khi túng thiếu hỏi người có đòi đc k? Giàu thì nhiều người ng theo quạnh hiu trống vắng khi nghèo Lời nói y thương đành trả lại ng thôi Nhìn cuộc đời trách sao k vừa tay với nhìn lại mình sao tay con đang trắng tay Bao lời y tiếng thương sao giờ xa vời, trong bóng đêm trập trùng ngồi 1 mình thôi Suốt cả đời này biết mấy ai thân Nhiều đêm thức giấc nhớ người tình nhân, còn gì để tặng nhau 1 khi lá đã đổi màu Tình nghĩa mai đem về trong lòng nguyện sâu nghĩa xưa chỉ còn lời nói hững hờ Cuộc đời khi có cho k rồi khi túng thiếu hỏi người có đòi đc k? Giàu thì nhiều người ng theo quạnh hiu trống vắng khi nghèo Lời nói y thương đành trả lại ng thôi Nhìn cuộc đời trách sao k vừa tay với nhìn lại mình sao tay con đang trắng tay Bao lời y tiếng thương sao giờ xa vời, trong bóng đêm trập trùng ngồi 1 mình thôi Suốt cả đời này biết mấy ai thân"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fontArray = UIFont.familyNames()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func keyBoardWillShow(notification :NSNotification)
    {
        if let frameObject: AnyObject = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]
        {
            let y = frameObject.CGRectValue.origin.y - 44
           self.showInput(y)
        }
    }
    
    func showInput(y:CGFloat){
        isShow = true
        UIView.animateWithDuration(0.4, animations: {
            self.actionView.frame.origin.y = y
        })
    }
    
    func hideInput(callback:(()->Void)?){
        comment.resignFirstResponder()
        UIView.animateWithDuration(0.15, animations: {
            self.actionView.frame.origin.y = self.frame.size.height - 44.0
            if((callback) != nil){
                callback!()
            }
        })
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        frame = self.view.frame
        actionView.frame = CGRectMake(0, frame.size.height - 44.0, frame.size.width, 44.0)
        self.view.addSubview(actionView)
        comment.becomeFirstResponder()
    }
    
    @IBAction func post(sender: AnyObject) {
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let s = formatter.stringFromDate(date)
        fontArray?.append("\(s)")
        content.append(comment.text!)
        tableView.reloadData()
    
        hideInput({
            self.comment.text = ""
        })
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if(isShow){
            isShow = false
            hideInput(nil)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell
        cell.lbFontName.text = self.fontArray![indexPath.row]
        let indext = indexPath.row % self.content.count
        cell.lbContent.text = self.content[indext]
        cell.lbContent.font = UIFont(name: self.fontArray![indexPath.row], size: 17)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.fontArray?.count)!
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    
}

