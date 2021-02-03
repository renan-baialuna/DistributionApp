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
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var coreManager: CoreManager?
    
    @IBOutlet weak var menuTable: UITableView!
    
    let infos = ["name", "e-mail", "phone", "adress"]
    var sectionsList: [SectionData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.delegate = self
        menuTable.dataSource = self
        coreManager = CoreManager(appDelegate: appDelegate)
        
        let section1 = SectionData(title: "Large", subTitle: "1-2 days", itens: infos, imageName: "IconSmall")
        let section2 = SectionData(title: "Medium", subTitle: "1-3 days", itens: infos, imageName: "IconMedium")
        let section3 = SectionData(title: "Small", subTitle: "1-5 days", itens: infos, imageName: "IconLarge")
        let section4 = SectionData(title: "Custom", subTitle: "5-10 days", itens: infos, imageName: "IconCustom")
        sectionsList = [section1, section2, section3, section4]
        
        let total = coreManager?.getAllDeliveries()
        
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
    
    func closeAll() {
        for i in 0..<sectionsList.count {
            sectionsList[i].isOpen = false
        }
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
            cell.selectionStyle = .none
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell") as! MenuItemTableViewCell
            cell.delegate = self
            cell.titleLabel.text = infos[indexPath.row]
            cell.row = indexPath.row
            cell.textEntry.text = ""
            switch indexPath.row {
            case 0:
                name = ""
                cell.textEntry.keyboardType = .default
            case 1:
                email = ""
                cell.textEntry.keyboardType = .emailAddress
            case 2:
                phone = ""
                cell.textEntry.keyboardType = .phonePad
            case 3:
                address = ""
                cell.textEntry.keyboardType = .default
            default:
                print("error")
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func generateAlert(title: String, subTitle: String) {
        let alert = UIAlertController(title: title, message: subTitle, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension NewDeliveryViewController: saveProtocol {
    func startSave(section: Int) {
        if  self.name != "" && self.email != "" && self.address != "" && self.phone != "" {
            let personalData = PersonalData(name: self.name, email: self.email, phone: self.phone, adress: self.address)
            let newDeliveryData = DeliveryData(data: personalData)
            if let core = coreManager {
                if core.saveDelivery(delivery: newDeliveryData) {
                    generateAlert(title: "Success", subTitle: "Delivery Saved")
                } else {
                    generateAlert(title: "Erro", subTitle: "There was an error saving the data, please try again")
                }
                closeAll()
            }
            
            
        } else {
            generateAlert(title: "Incomplete", subTitle: "All fields must be filled")
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
