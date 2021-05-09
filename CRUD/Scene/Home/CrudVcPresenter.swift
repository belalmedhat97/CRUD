//
//  CrudPresenter.swift
//  CRUD
//
//  Created by belal medhat on 08/05/2021.
//

import Foundation
class CrudVcViewPresenter:CrudVcPresenter{
    
    var view: CrudVcViewProtocols?
    
    init(view:CrudVcViewProtocols){
        self.view = view
    }
    func createReq(ID: Int, Name: String) {
        self.view?.showIndicator()
        Network.Request(URL:CrudAPIRouter.Create(ID: ID, Name: Name).urlRequest) { (result:CustomResults<CreateSuccessResponse,CreateFailureResponse,Error>) in
            
            switch result{
                case .success(let response):
                    print(response)
                    print(response.createdAt ?? "")
                    UserDefaults.standard.setValue(response.objectId, forKey: "objectId")
                    DispatchQueue.main.async {
                        self.view?.updateResponseLabel(Title: response.objectId ?? "")
                    }
                    self.view?.hideIndicator()
 
                case .failure(let error):
                    print(error.code ?? "100")
                    print(error)
                    self.view?.hideIndicator()

                case .failureError(let error):
                    print(error.localizedDescription)
                    self.view?.hideIndicator()

                        }
        }
    }
    
    func readReq(ID: Int) {
        self.view?.showIndicator()

        Network.Request(URL:CrudAPIRouter.Read(ID: ID).urlRequest) { (result:CustomResults<ReadSuccessResponse,ReadFailureResponse,Error>) in
            
            switch result{
                case .success(let response):
                    print(response)
                    print(response.results[0].Name ?? "")
                    DispatchQueue.main.async {
                        self.view?.updateResponseLabel(Title: response.results[0].Name ?? "")

                    }
                    self.view?.hideIndicator()


                case .failure(let error):
                    print(error.code ?? "100")
                    print(error)
                    self.view?.hideIndicator()

                case .failureError(let error):
                    print(error.localizedDescription)
                    self.view?.hideIndicator()

                        }
        }
    }
    
    func updateReq(Name: String) {
        self.view?.showIndicator()

        Network.Request(URL:CrudAPIRouter.Update(Name: Name).urlRequest) { (result:CustomResults<UpdateSuccessResponse,UpdateFailureResponse,Error>) in
            
            switch result{
                case .success(let response):
                    print(response)
                    print(response.updatedAt ?? "")
                    DispatchQueue.main.async {
                        self.view?.updateResponseLabel(Title: response.updatedAt ?? "")

                    }

                    self.view?.hideIndicator()

                case .failure(let error):
                    print(error.code ?? "100")
                    print(error)
                    self.view?.hideIndicator()

                case .failureError(let error):
                    print(error.localizedDescription)
                    self.view?.hideIndicator()

                        }
        }
    }
    
    func deleteReq() {
        self.view?.showIndicator()
        Network.Request(URL:CrudAPIRouter.Delete.urlRequest) { (result:CustomResults<DeleteSuccessResponse,DeleteFailureResponse,Error>) in
            
            switch result{
                case .success(let response):
                    print(response)
                    print(response)
                    self.view?.hideIndicator()

                case .failure(let error):
                    print(error.code ?? "100")
                    print(error)
                    self.view?.hideIndicator()

                case .failureError(let error):
                    print(error.localizedDescription)
                    self.view?.hideIndicator()

                        }
        }
    }
    
    
}
