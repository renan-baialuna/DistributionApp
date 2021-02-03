//
//  CentersViewController.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 02/02/21.
//

import UIKit
import MapKit

class CentersViewController: UIViewController {
    
    var centers: [DistributionCenter] = []
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        addMockData()
        
        // Do any additional setup after loading the view.
    }
    
    func addMockData() {
        let center1 = DistributionCenter(id: "1", disponibility: "24/7", address: "Rua", city: "cidade", state: "estado", cep: "cep", ocupation: 30, geolocation: CLLocationCoordinate2D(latitude: -23.5413011681, longitude: -46.6399557735))
        let center2 = DistributionCenter(id: "2", disponibility: "24/7", address: "Rua", city: "cidade", state: "estado", cep: "cep", ocupation: 50, geolocation: CLLocationCoordinate2D(latitude: -23.5342, longitude: -46.6336))
        let center3 = DistributionCenter(id: "3", disponibility: "8-5", address: "Rua", city: "cidade", state: "estado", cep: "cep", ocupation: 100, geolocation: CLLocationCoordinate2D(latitude: -23.5439, longitude:  -46.6273))
        
        centers = [center1, center2, center3]
        for center in centers {
            let annotation = MKPointAnnotation()
            annotation.coordinate = center.geolocation
            map.addAnnotation(annotation)
        }
        
        
        
        let region = MKCoordinateRegion(center: centers[2].geolocation, latitudinalMeters: 5000, longitudinalMeters: 5000)
        map.setRegion(region, animated: true)
    }
}

extension CentersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return centers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CenterTableViewCell") as! CenterTableViewCell
        let center = centers[indexPath.row]
        cell.codeLabel.text = center.id
        cell.timeLabel.text = center.disponibility
        cell.streetLabel.text = center.address
        cell.adressLabel.text = "\(center.city), \(center.state) - \(center.cep)"
        cell.ocupationLabel.text = "\(center.ocupation)%"
        cell.ocupationBar.progress = Float(center.ocupation)/100
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let region = MKCoordinateRegion(center: centers[indexPath.row].geolocation, latitudinalMeters: 500, longitudinalMeters: 500)
        map.setRegion(region, animated: true)
    }
}
