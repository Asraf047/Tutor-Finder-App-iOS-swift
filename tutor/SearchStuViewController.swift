import UIKit
import Firebase

struct Headline {
    
    var id : Int
    var title : String
    var text : String
    var image : String
    
}

struct Students {
    
    var name: String
    var address: String
    var education: String
    var fee: String
    var institute: String
    var phone: String
    var subjects: String
    var s_id: String
    
    
    //    init(dictionary: [String: AnyObject]) {
    //        name = dictionary.name
    //        address = dictionary.address
    //        education = dictionary.education
    //        fee = dictionary.fee
    //        institute = dictionary.institute
    //        phone = dictionary.phone
    //        subjects = dictionary.subjects
    //        s_id = id
    //    }
    
}

class SearchStuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textLabel: UILabel!
    
    var username:String = ""
    let textCellIdentifier = "TextCell"
    var users = [Students]()
    
    let swiftBlogs = ["Ray Wenderlich", "NSHipster", "iOS Developer Tips", "Jameson Quave", "Natasha The Robot", "Coding Explorer", "That Thing In Swift", "Andrew Bancroft", "iAchieved.it", "Airspeed Velocity"]
    
    //    let headlines = [
    //        Headline(id: 1, title: "Lorem Ipsum", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", image: "Apple"),
    //        Headline(id: 2, title: "Aenean condimentum", text: "Ut eget massa erat. Morbi mauris diam, vulputate at luctus non.", image: "Banana"),
    //        Headline(id: 3, title: "In ac ante sapien", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc.", image: "Cantaloupe"),
    //        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = username.components(separatedBy: "spit")
        
        textLabel?.text = array[0]
        
//        var ref: DatabaseReference!
//
//        ref = Database.database().reference()
//        //let userID = Auth.auth().currentUser?.uid
//        ref.child("Teacher").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            //let value = snapshot.value as? [String:Any]
//            //let username = value?["username"] as? String ?? ""
//            //let user = User(username: username)
//
//            for child in snapshot.children {
//                let snap = child as! DataSnapshot
//                let key = snap.key
//                let value = snap.value
//                print("key = \(key)  value = \(value!)")
//            }
//
//            DispatchQueue.main.async{
//                //self.demoTexts.text = "\(value)"
//            }
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        //
        //        ref.observe(.value, with: { snapshot in
        //            var facility: [Students] = []
        //
        //            for code in snapshot.children {
        //                let snapShot = code as! DataSnapshot
        //                let value = snapShot.value as? [String:Any] ? [:]
        //                let facilityArray = value.map {Students(snapshot: snapShot, id: $0)
        //                }
        //                facility += facilityArray
        //            }
        //            //self.facility_id_Arr = facility
        //            //print("facitlities  ---",self.facility_id_Arr)
        //        })
        
        
        tableView.delegate = self
        tableView.dataSource = self
        fetchUser()
    }
    
        func fetchUser() {
            //var ref: DatabaseReference!
    
//                    ref = Database.database().reference()
//                    //let userID = Auth.auth().currentUser?.uid
//                            ref.child("Teacher").observeSingleEvent(of: .value, with: { (snapshot) in
//                                // Get user value
//                                //let value = snapshot.value as? [String:Any]
//                                //let username = value?["username"] as? String ?? ""
//                                //let user = User(username: username)
//
//                                for child in snapshot.children {
//                                    let snap = child as! DataSnapshot
//                                    let key = snap.key
//                                    let value = snap.value
//                                    print("key = \(key)  value = \(value!)")
//                                }
//
//                                DispatchQueue.main.async{
//                                    //self.demoTexts.text = "\(value)"
//                                }
//                            }) { (error) in
//                                print(error.localizedDescription)
//                            }
    
            Database.database().reference().child("Teacher").observe(.childAdded, with: { (snapshot) in
    
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    //var user = Students(dictionary: dictionary)
    //                _ = dictionary["category"] as! String
    //                let name = dictionary["name"] as! String
                    let user = Students(name: dictionary["name"] as! String, address: dictionary["address"] as! String, education: dictionary["education"] as! String,fee: dictionary["fee"] as! String, institute: dictionary["institute"] as! String, phone: dictionary["phone"] as! String,subjects: dictionary["subjects"] as! String, s_id: snapshot.key)
                    //user.s_id = snapshot.key
                    print(user.name)
                    print("key = \(snapshot.key)  value ")
                    self.users.append(user)
    
                    //this will crash because of background thread, so lets use dispatch_async to fix
                    DispatchQueue.main.async(execute: {
                        self.tableView.reloadData()
                    })
    
                    //                user.name = dictionary["name"]
                }
    
            }, withCancel: nil)
        }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.phone
        
        
//        let row = indexPath.row
//        cell.textLabel?.text = swiftBlogs[row]
        
        //        let headline = headlines[indexPath.row]
        //        cell.textLabel?.text = headline.title
        //        cell.detailTextLabel?.text = headline.text
        //cell.imageView?.image = UIImage(named: headline.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let row = indexPath.row
        print(swiftBlogs[row])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


