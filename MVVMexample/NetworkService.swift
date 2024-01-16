//
//  NetworkService.swift
//  MVVMexample
//
//  Created by 박민정 on 2024/01/16.
//

import UIKit

final class NetworkService {
    static let shared = NetworkService()
    
    private init() { }
    
    func login(id: String, password: String, completion: @escaping(Bool) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if datas.first(where: { $0.userid == id && $0.pwd == password }) != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

//debounce, 쓰로틀? throttle -> 중복입력 막는 기법
//flag값을 주기도 했음
