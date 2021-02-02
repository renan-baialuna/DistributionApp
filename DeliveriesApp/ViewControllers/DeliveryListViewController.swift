//
//  ViewController.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 30/01/21.
//

import UIKit

class DeliveryListViewController: UIViewController {
    var topHidden = true
    var isFiltered = false
    
    
    var deliveryList: [Delivery] = []
    var filteredList: [Delivery] = []
    
    @IBOutlet weak var searchTextFiled: UITextField!
    @IBOutlet weak var topButton: UIButton!
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
        
    }
    
    func setMock() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let someDateTime1 = formatter.date(from: "2016/10/08 22:31")
        let someDateTime2 = formatter.date(from: "2019/10/10 22:31")
        
        let deli1 = Delivery(id: "1", status: .inTransit, lastUpdate: someDateTime1!, porcentage: 15)
        let deli2 = Delivery(id: "2", status: .delivered, lastUpdate: someDateTime2!, porcentage: 80)
        deliveryList.append(deli1)
        deliveryList.append(deli1)
        deliveryList.append(deli2)
        deliveryList.append(deli2)
        
        DeliveryList.reloadData()
    }

    @IBAction func changeTop() {
        setTopVisible(!topHidden)
    }
    
    @IBAction func filterList() {
        isFiltered = true
        
        filterData(searchTextFiled.text!)
        DeliveryList.reloadData()
    }
    
    @IBAction func clearFilter() {
        isFiltered = false
        DeliveryList.reloadData()
    }
    
    func filterData(_ id: String) {
        filteredList = deliveryList.filter {
            $0.id == id
        }
    }
    
    func setTopVisible(_ statusTop: Bool) {
        if statusTop {
            let image = UIImage(systemName: "arrow.up", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
            topButton.setImage(image!, for: .normal)
            heightCont.constant = CGFloat(300)
            searchView.isHidden = false
        } else {
            let image = UIImage(systemName: "arrow.down", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
            topButton.setImage(image!, for: .normal)
            heightCont.constant = CGFloat(100)
            searchView.isHidden = true
        }
        topHidden = statusTop
    }

}

extension DeliveryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltered {
            return filteredList.count
        } else {
            return deliveryList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var delivery: Delivery
        if isFiltered {
            delivery = filteredList[indexPath.row]
        } else {
            delivery = deliveryList[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryTableViewCell") as! DeliveryTableViewCell
        cell.idLabel.text = delivery.id
        cell.statuLabel.text = delivery.statusString
        cell.lastUpdateLabel.text = delivery.lastUpdateString
        if delivery.status == .delivered {
            cell.statusProgressView.isHidden = true
        } else {
            cell.statusProgressView.setProgress(Float(delivery.porcentage)/100, animated: false)
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setTopVisible(false)
    }
    
    
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "LocalizableString",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
