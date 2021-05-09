//
//  ViewController.swift
//  CRUD
//
//  Created by belal medhat on 08/05/2021.
//

import UIKit

class CrudVc: UIViewController,CrudVcViewProtocols {
   
    
    var presenter: CrudVcPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        self.presenter = CrudVcViewPresenter(view: self)
        fieldStack.layer.borderWidth = 1
        fieldStack.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        fieldStack.layer.cornerRadius = 10
        Activity.isHidden = true
    }
    
    func showIndicator() {
        DispatchQueue.main.async { [self] in
            Activity.isHidden = false
            Activity.startAnimating()
        }
       
    }
    
    func hideIndicator() {
        DispatchQueue.main.async { [self] in
            Activity.isHidden = true
            Activity.stopAnimating()
        }
      
        
    }
    func updateResponseLabel(Title:String) {
        responseLabel.text = Title
        Activity.isHidden = true
    }
    @IBOutlet weak var Activity: UIActivityIndicatorView!
    @IBOutlet weak var fieldStack: UIStackView!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var NameField: UITextField!
    
    @IBAction func crudbuttons(_ sender: UIButton) {
        guard idField.text != "" && NameField.text != "" else {
            // create the alert
              let alert = UIAlertController(title: "EMPTY FIELDS", message: "Enter Data In Id And Name Field", preferredStyle: UIAlertController.Style.alert)

              // add an action (button)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

              // show the alert
              self.present(alert, animated: true, completion: nil)
            return
        }
        switch sender.tag {
        case 0:
            self.presenter?.createReq(ID: Int(idField.text!) ?? 1, Name: NameField.text!)
        case 1:
            self.presenter?.readReq(ID: Int(idField.text!) ?? 1)
        case 2:
            self.presenter?.updateReq(Name: "John")
        case 3:
            self.presenter?.deleteReq()
      
        default:
            ""
        }
    }
}

