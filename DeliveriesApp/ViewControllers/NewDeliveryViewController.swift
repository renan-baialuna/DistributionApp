//
//  NewDeliveryViewController.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 31/01/21.
//

import UIKit

protocol saveProtocol {
    func startSave(section: Int)
}

protocol changeField {
    func changeTextField(row: Int, text: String?)
}

class NewDeliveryViewController: UIViewController {
    let sectionHeight:CGFloat = 100
    
    var name = ""
    var email = ""
    var phone = ""
    var address = ""
    
    @IBOutlet weak var menuTable: UITableView!
    
    let infos = ["name", "e-mail", "phone", "adress"]
    var sectionsList: [SectionData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.delegate = self
        menuTable.dataSource = self
        
        let section1 = SectionData(title: "Large", subTitle: "1-2 days", itens: infos, imageName: "IconSmall")
        let section2 = SectionData(title: "Medium", subTitle: "1-3 days", itens: infos, imageName: "IconSmall")
        let section3 = SectionData(title: "Small", subTitle: "1-5 days", itens: infos, imageName: "IconSmall")
        let section4 = SectionData(title: "Custom", subTitle: "5-10 days", itens: infos, imageName: "IconSmall")
        sectionsList = [section1, section2, section3, section4]
        
    }
    

}

extension NewDeliveryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeight
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionInfo = sectionsList[section]
        
        
        let subView = UIView()
        
        subView.backgroundColor = UIColor.orange
        
        let image = UIImage(named: sectionInfo.imageName)
        let imageView = UIImageView(image: image)
        
        subView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: sectionHeight).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: sectionHeight).isActive = true
        imageView.leadingAnchor.constraint(equalTo: subView.leadingAnchor).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = sectionInfo.title
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = sectionInfo.subTitle
        
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        subView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: sectionHeight).isActive = true
        stackView.trailingAnchor.constraint(equalTo: subView.trailingAnchor).isActive = true
        
        
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: sectionHeight))
        bt.backgroundColor = .none
        bt.addTarget(self, action: #selector(expandClose), for: .touchUpInside)
        bt.tag = section
        subView.addSubview(bt)
        
        return subView
    }
    
    @objc func expandClose(button: UIButton) {
        let section = button.tag
        sectionsList[button.tag].isOpen = !sectionsList[button.tag].isOpen
        menuTable.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sectionsList[section]
        if section.isOpen {
            return section.itens.count + 1
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == infos.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell") as! ButtonTableViewCell
            cell.delegate = self
            cell.section = indexPath.section
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell") as! MenuItemTableViewCell
            cell.delegate = self
            cell.titleLabel.text = infos[indexPath.row]
            cell.row = indexPath.row
            return cell
        }
    }
    
    
}

extension NewDeliveryViewController: saveProtocol {
    func startSave(section: Int) {
        if  self.name != "" && self.email != "" && self.address != "" && self.phone != "" {
            let personalData = PersonalData(name: self.name, email: self.email, phone: self.phone, adress: self.address)
        } else {
            print("incompleto")
        }
    }
}

extension NewDeliveryViewController: changeField {
    func changeTextField(row: Int, text: String?) {
        if let text = text {
            switch row {
            case 0:
                self.name = text
            case 1:
                self.email = text
            case 2:
                self.phone = text
            case 3:
                self.address = text
            default:
                print("error")
            }
        }

    }
}
