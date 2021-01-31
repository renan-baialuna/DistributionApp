//
//  ViewController.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 30/01/21.
//

import UIKit

class DeliveryListViewController: UIViewController {
    var topHidden = true
    
    
    var deliveryList: [Delivery] = []
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var heightCont: NSLayoutConstraint!
    
    @IBOutlet weak var DeliveryList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DeliveryList.delegate = self
        DeliveryList.dataSource = self
        
        
        setTopVisible(false)
        setMock()
        
        // Do any additional setup after loading the view.
    }
    
    func setMock() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let someDateTime = formatter.date(from: "2016/10/08 22:31")
        
        let deli1 = Delivery(id: "1", status: .inTransit, lastUpdate: someDateTime!, porcentage: 15)
        deliveryList.append(deli1)
        
        DeliveryList.reloadData()
    }

    @IBAction func changeTop() {
        setTopVisible(!topHidden)
        
    }
    
    func setTopVisible(_ statusTop: Bool) {
        if statusTop {
            heightCont.constant = CGFloat(300)
            searchView.isHidden = false
        } else {
            heightCont.constant = CGFloat(100)
            searchView.isHidden = true
        }
        topHidden = statusTop
    }

}

extension DeliveryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryTableViewCell") as! DeliveryTableViewCell
        cell.idLabel.text = "1"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setTopVisible(false)
    }
    
    
}
