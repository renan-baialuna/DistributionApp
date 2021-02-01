//
//  NewDeliveryViewController.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 31/01/21.
//

import UIKit

class NewDeliveryViewController: UIViewController {
    let sectionHeight:CGFloat = 100
    
    
    @IBOutlet weak var menuTable: UITableView!
    
    
    
    
    var menus = ["Lage", "Medium", "Small", "Custom" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.delegate = self
        menuTable.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    

}

extension NewDeliveryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeight
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let subView = UIView()
        subView.backgroundColor = UIColor.orange
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: sectionHeight, height: sectionHeight))
        let image = UIImage(named: "IconSmall")
        bt.setImage(image, for: .normal)
        subView.addSubview(bt)
        return subView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell") as! MenuItemTableViewCell

        return cell
    }
    
    
}
