import Foundation

final class LoginViewModel {
    
    var error: ObservableObject<String?> = ObservableObject("")
    
    func login(id: String, password: String) {
        NetworkService.shared.login(id: id, password: password) {
            [weak self] success in
            print("NetworkService에 대한 completion 값", success)
            if success {
                print("Login successful")
                self?.error.value = nil
            } else {
                print("Login failed")
                self?.error.value = "로그인에 실패했습니다."
            }
        }
    }
}

//result type 공부해보기
//loginresult로 변수명을 줘도 좋을 듯
//튜플 형태로 보내도 좋을 듯 -> true/nil로 왼쪽에서 바인딩 해도 좋을듯


//구독과 방출 개념 다시 정리해보기
//구독이 됐는데 실행이 안되면 방출부분을 확인한다
//방출을 했는데 구독이 실행이 안되면 구독 부분을 확인한다
