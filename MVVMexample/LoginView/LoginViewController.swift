import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idField : UITextField!
    @IBOutlet weak var pwdField: UITextField!
    
    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
    }
    
    private func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToHomePage()
            }
        }
    }
    
    //메인페이지로 가는 법
    private func goToHomePage() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            return
        }
        present(controller, animated: true, completion: nil)
    }


    
    @IBAction func singupBtnClicked(_ sender: UIButton) {
        let title = "회원가입"
        let message = "추가할 계정를 입력하세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField() { (tf) in
            tf.placeholder = "name"
        }
        alert.addTextField() { (tf) in
            tf.placeholder = "id"
        }
        alert.addTextField() { (tf) in
            tf.placeholder = "pwd"
        }
        
        let add = UIAlertAction(title: "추가", style: .default) {
            _ in
            let newname = alert.textFields?[0]
            let newid = alert.textFields?[1]
            let newpwd = alert.textFields?[2]
            
            let newuser = User(name: newname!.text ?? "", userid: newid!.text ?? "", pwd: newpwd!.text ?? "")
            datas.append(newuser)
        }
        
        alert.addAction(add)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guard let id = idField.text,
              let pwd = pwdField.text
        else { return }
        viewModel.login(id: id, password: pwd)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
}
