//
//  MainTableViewController.swift
//  Books
//
//  Created by SDS-018 on 2017. 4. 27..
//  Copyright © 2017년 SDS-018. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, LoginProtocol {

    //var myArr:[String] = Array<String>()
    var myArr:[[String:String]] = Array<[String:String]>()
    
    var userName:String?
    
    var appdelegate: AppDelegate? = UIApplication.shared.delegate! as? AppDelegate
    
    @IBAction func openLoginScene(_ sender: Any) {
 
        /*
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginView") as? LoginViewController{
            loginVC.delegate = self
            self.present(loginVC, animated: true, completion: nil)
        }
        self.dismiss(animated: true, completion: nil)
    */
        
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginView") as? LoginViewController else {
            return
        }
        
        loginVC.delegate = self
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func completedLogin(name: String) {
        print(name)
        userName = name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*
        myArr.append("홍길동")
        myArr.append("김민수")
        myArr.append("허경영")
        */
    /*
        let dict1:[String:String] = ["name":"홍길동", "phone":"010-555-5555"]
        let dict2:[String:String] = ["name":"최민수", "phone":"010-222-5555"]
        let dict3:[String:String] = ["name":"허경영", "phone":"010-333-5555"]
        
        myArr.append(dict1)
        myArr.append(dict2)
        myArr.append(dict3)
      */
    }

  
    override func viewWillAppear(_ animated: Bool) {
        if let uName = userName{
            let alert = UIAlertController(title: "Books 앱을 시작합니다", message: "\(uName)님 환영합니다", preferredStyle: UIAlertControllerStyle.alert)    //actionSheet)    //alert)
            
             let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true){
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: {
                    (Timer) -> Void in
                    alert.dismiss(animated: true, completion: nil)
                })
                
            }
        }
        
        self.tableView.reloadData()
    }
 
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1        //섹션 1개
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 100        // 로우10개
        //return myArr.count
        
        if let books = appdelegate?.books{
            return books.count
        } else{
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        //cell.textLabel?.text = "Hello World"
        //cell.detailTextLabel?.text = "My World"
        
        //print("Row: \(indexPath.row)")
        
        //var  dict = myArr[indexPath.row]
        
        
        guard let books = appdelegate?.books else {
            return cell
        }
        
        //cell.textLabel?.text = myArr[indexPath.row]
        //cell.textLabel?.text = dict["name"]
        //cell.detailTextLabel?.text = dict["phone"]

        cell.textLabel?.text = books[indexPath.row].title
        cell.detailTextLabel?.text = books[indexPath.row].author
        cell.imageView?.image = books[indexPath.row].coverImage
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
