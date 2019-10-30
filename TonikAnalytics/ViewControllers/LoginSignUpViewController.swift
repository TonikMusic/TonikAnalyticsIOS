//  Created by Maximo Hinojosa 3 on 9/13/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation
import UIKit



class LoginSignupViewController: UIViewController {
    
    //NOTE: Instantiating variables
    lazy var viewHeight = self.view.frame.height
    lazy var viewWidth = self.view.frame.width
    lazy var viewCenterY = self.view.frame.midY
    var addYAxisToLoginSignupView: NSLayoutConstraint!
    var addHeightPaddingToLoginSignupView: NSLayoutConstraint!
    var addYAxisToLogoView: NSLayoutConstraint!
    let datePickerView: UIDatePicker = UIDatePicker()
    
    // NOTE: Explicitly being created when constraints are added
    lazy var loginSignupView: LoginSignUpView = self.createLoginSignUpView()
    lazy var logoView: LogoView = self.createLogoView()
    lazy var dontHaveAccountlable: Label = self.createDontHaveAccountlable()
    lazy var createAccountBtn: Button = self.createButton()
    lazy var loginSignUpBtn: Button = self.createLoginSignUpBtn()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        createAccountBtn.addTarget(self, action: #selector(didPressAccountBtn), for: .touchUpInside)
        loginSignUpBtn.addTarget(self, action: #selector(didPressLoginSignupBtn), for: .touchUpInside)
        layout()
        showDatePicker()
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    
    
    private func showAlert(with message: String) {
        let alert = AlertService.setupAlert(alertTitle: "Error", alertMessage: message, alertStyle: .alert, actionTitle: "OK", actionStyle: .cancel)
        present(alert, animated: true, completion: nil)
    }
    
    // NOTE: This funciton sets up the date picker along with a tool bar
    private func showDatePicker() {
        datePickerView.datePickerMode = .date
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        self.loginSignupView.dateOfBirth.inputView = datePickerView
    }
    
    // MARK: - Objective Methods
    @objc func didPressLoginSignupBtn() {
        handleAuth()
    }

    @objc func didPressAccountBtn() {
        addAnimationToViews()
    }
    
    @objc func datePickerValueChanged() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        self.loginSignupView.dateOfBirth.text = formatter.string(from: datePickerView.date)
        
    }
    
    //NOTE: handles email validity
    @objc func isValidEmail(_ sender: AnyObject?) {
        guard let email = sender?.text else { return }
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let result = emailTest.evaluate(with: email)
        
        if result != true {
            self.loginSignUpBtn.isEnabled = false
        } else {
            self.loginSignUpBtn.isEnabled = false
        }
    }
    
    @objc func validatePassword(_ sender: AnyObject?) {
           
        guard let password = sender?.text else { return }
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{10,}$")
        let result = passwordTest.evaluate(with: password)

        if result != true {
        self.loginSignUpBtn.isEnabled = false
        } else {
        self.loginSignUpBtn.isEnabled = true
        }
    }
    
    // MARK: - Animations
    
    // NOTE: This function animates the given views
    private func addAnimationToViews() {
        
        if  createAccountBtn.currentTitle == "Sign Up" {
            
            self.loginSignupView.userName.isEnabled = true
            self.loginSignupView.confirmPassword.isEnabled = true
            self.addYAxisToLogoView.constant = (-viewCenterY / 5) * 3.2
            self.addYAxisToLoginSignupView.constant = viewCenterY / 9 - 50
            self.addHeightPaddingToLoginSignupView.constant = viewHeight / 2 + 50
            self.loginSignupView.addTopPaddingToEmail.constant = 20
            self.loginSignupView.addTopPaddingPassword.constant = 20
            self.loginSignupView.addTopPaddingToConfirmPassword.constant = 20
            self.loginSignupView.addTopPaddingToView.constant = 20
            
            

            UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveEaseInOut, animations: {

                self.view.layoutIfNeeded()
                self.dontHaveAccountlable.alpha = 0
                self.loginSignupView.userName.alpha = 1
                self.loginSignupView.lineView1.alpha = 1
                self.loginSignupView.confirmPassword.alpha = 1
                self.loginSignupView.lineView4.alpha = 1
                self.loginSignupView.toggleSwitch.alpha = 1
                self.loginSignupView.artistLabel.alpha = 1
                self.loginSignupView.dateOfBirth.alpha = 1
                
            })
            
            
            UIView.animate(withDuration: 0.9) {
                self.dontHaveAccountlable.alpha = 1
                self.dontHaveAccountlable.text = "Already have an account?"
                self.loginSignUpBtn.setTitle("Sign Up", for: .normal)
                self.createAccountBtn.setTitle("Log In", for: .normal)
                
            }

        } else {
            
            self.loginSignupView.userName.isEnabled = true
            self.loginSignupView.confirmPassword.isEnabled = true
            self.addYAxisToLoginSignupView.constant = viewCenterY / 5 - 30
            self.addHeightPaddingToLoginSignupView.constant = viewHeight/3 + 30
            self.addYAxisToLogoView.constant = -(viewCenterY / 6) * 2
            self.loginSignupView.addTopPaddingToEmail.constant = -40
            self.loginSignupView.addTopPaddingPassword.constant = 40
            self.loginSignupView.addTopPaddingToConfirmPassword.constant = -40
            self.loginSignupView.addTopPaddingToView.constant = -40
            
            UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveEaseInOut, animations: {
                
                self.view.layoutIfNeeded()
                self.dontHaveAccountlable.alpha = 0
                self.loginSignupView.userName.alpha = 0
                self.loginSignupView.lineView1.alpha = 0
                self.loginSignupView.confirmPassword.alpha = 0
                self.loginSignupView.lineView4.alpha = 0
                self.loginSignupView.toggleSwitch.alpha = 0
                self.loginSignupView.artistLabel.alpha = 0
                self.loginSignupView.dateOfBirth.alpha = 0
                
            })
            
            
            UIView.animate(withDuration: 0.9, animations: {
                self.dontHaveAccountlable.alpha = 1
                self.dontHaveAccountlable.text = "Don't have an account?"
                self.loginSignUpBtn.setTitle("Log In", for: .normal)
                self.createAccountBtn.setTitle("Sign Up", for: .normal)
                
            })

        }
    }
    
    // MARK: - Authentication Methods
    fileprivate func handleAuth() {
        guard
            let userName = loginSignupView.userName.text,
            let email = loginSignupView.email.text,
            let password = loginSignupView.password.text,
            let confirmPassword = loginSignupView.confirmPassword.text
            else { return }
        
        
        switch loginSignUpBtn.currentTitle {
        case "Sign Up":
            let isValid = validateSignUpFields(userName, email, password, confirmPassword)
            if isValid == true {
                let user = User(userName: "qqwghjesd32r", email: "qwerqghjwe45@gmail.com", password: "Toomuch405")
                let newUser = User(userName: userName, email: email, password: password)
                signUp(newUser)
            }
        case "Log In":
            break
        default:
            break
        }
    }
    
    //NOTE: function validates sign up required fields
    fileprivate func validateSignUpFields(_ userName: String, _ email: String, _ password: String, _ confirmPassword: String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{10,}$")
        
        if userName.count == 0 && email.count == 0 && password.count == 0 && confirmPassword.count == 0 {
            let alert = AlertService.setupAlert(alertTitle: "Error", alertMessage: "Please complete registration.", alertStyle: .alert, actionTitle: "OK", actionStyle: .cancel)
            self.present(alert, animated: true, completion: nil)
            return false
        } else if userName.count == 0 || email.count == 0 || password.count == 0 || confirmPassword.count == 0 {
            let alert = AlertService.setupAlert(alertTitle: "Error", alertMessage: "Please complete registration.", alertStyle: .alert, actionTitle: "OK", actionStyle: .cancel)
            self.present(alert, animated: true, completion: nil)
            return false
        } else if emailTest.evaluate(with: email) != true {
            let alert = AlertService.setupAlert(alertTitle: "Error", alertMessage: "Please enter a valid email.", alertStyle: .alert, actionTitle: "OK", actionStyle: .cancel)
            self.present(alert, animated: true, completion: nil)
            return false
        } else if passwordTest.evaluate(with: password) != true {
            let alert = AlertService.setupAlert(alertTitle: "Error", alertMessage: "Password must be atleast 10 characters long.", alertStyle: .alert, actionTitle: "OK", actionStyle: .cancel)
            self.present(alert, animated: true, completion: nil)
            return false
        } else if password != confirmPassword {
            let alert = AlertService.setupAlert(alertTitle: "Error", alertMessage: "Please reconfirm your password.", alertStyle: .alert, actionTitle: "OK", actionStyle: .cancel)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    //NOTE: validates log in required fields
    fileprivate func validateLoginFields(_ email: String, _ password: String) -> Bool {
        if email.count == 0 || password.count == 0 {
            let alert = AlertService.setupAlert(alertTitle: "Error", alertMessage: "Please complete registration.", alertStyle: .alert, actionTitle: "OK", actionStyle: .cancel)
            self.present(alert, animated: true, completion: nil)
            return false
        } else if email.count == 0 && password.count == 0 {
            let alert = AlertService.setupAlert(alertTitle: "Error", alertMessage: "Please enter email and password.", alertStyle: .alert, actionTitle: "OK", actionStyle: .cancel)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    fileprivate func signUp(_ newUser: User) {
        self.showSpinner()
        // NOTE: handling user sign up
        NetworkService.signUpRequest(newUser: newUser) { (result) in
            switch result {
            case .success(let value):
                if value["message"] != nil {
                    self.removeSpinner()
                    self.showAlert(with: "\(value["message"]!). Please try again.")
                } else {
                    //TODO: save token in useDefaults
                    self.removeSpinner()
//                    let layout = UICollectionViewFlowLayout()
//                    layout.scrollDirection = .horizontal
//                    let onBoardingVC = OnBoardingViewController(collectionViewLayout: layout)
//                    self.navigationController?.pushViewController(onBoardingVC, animated: true)
                }
            case .failure(let error):
                self.removeSpinner()
                print(error)
            }
        }
    }
}
