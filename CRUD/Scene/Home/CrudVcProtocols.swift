//
//  CrudProtocols.swift
//  CRUD
//
//  Created by belal medhat on 08/05/2021.
//

import Foundation
protocol CrudVcViewProtocols {
    var presenter:CrudVcPresenter? {get set}
    func updateResponseLabel(Title:String)
    func showIndicator()
    func hideIndicator()
}
protocol CrudVcPresenter {
    var view:CrudVcViewProtocols? {get set}
    func createReq(ID:Int,Name:String)
    func readReq(ID:Int)
    func updateReq(Name:String)
    func deleteReq()
}
