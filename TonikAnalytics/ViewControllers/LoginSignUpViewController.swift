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
    
    
    @objc func didPressLoginSignupBtn() {
        handleLoginSignUp()
    }

    @objc func didPressAccountBtn() {
        addAnimationToViews()
    }
    
    @objc func datePickerValueChanged() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        self.loginSignupView.dateOfBirth.text = formatter.string(from: datePickerView.date)
        
    }
    
    // NOTE: This funciton sets up the date picker along with a tool bar
    private func showDatePicker() {
        datePickerView.datePickerMode = .date
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
//
//        let toolBar = UIToolbar().ToolbarPicker(mySelect: #selector(doneDatePickerPressed))
//        self.loginSignupView.dateOfBirth.inputAccessoryView = toolBar
        self.loginSignupView.dateOfBirth.inputView = datePickerView
    }
    
    //NOTE: Updates super view visibility when keyboard is called
    private func updateViewToUseKeyBorad() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        hideKeyboardTapped()
    }
    
    
    
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
    
    
    func handleLoginSignUp() {
        guard
            let userName = loginSignupView.userName.text,
            let email = loginSignupView.email.text,
            let password = loginSignupView.password.text,
            let confirmPassword = loginSignupView.password.text,
            let dob = loginSignupView.dateOfBirth.text
            else { return }
        
        
        
        if self.loginSignUpBtn.currentTitle == "Sign Up" {
            
            if userName.count <= 0 && email.count <= 0 && password.count <= 0 {
                let alertController = UIAlertController(title: "Error", message: "Please complete registration.", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            } else if email.count < 0 || password.count < 0 {
                let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
            
                self.present(alertController, animated: true, completion: nil)
            } else {
                let user = User(fullName: "nit", userName: "lil nit", email: "tester@gmail.com", password: "nitTester24dabest", dob: "May 13, 1997", artist: true)
                // NOTE: handling user sign up
                LoginSignUpService.signUpRequest(newUser: user) { (data) in
                    // NOTE: Save Token
                    print(data)
                    if (data != nil) {
                        // NOTE: After creating creating a user successfully continue to onboarding
                        let layout = UICollectionViewFlowLayout()
                        layout.scrollDirection = .horizontal
                        let onBoardingVC = OnBoardingViewController(collectionViewLayout: layout)
                        self.navigationController?.pushViewController(onBoardingVC, animated: true)
                    }
                    
                }
            }
            
        } else {
            // NOTE: handling user login
            
            if email.count <= 0 || password.count <= 0 {
                let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            } else {
                let returningUser = ReturningUser(email: email, password: password)
                LoginSignUpService.loginRequest(user: returningUser) { (token) in
                    print(token)
                    let tabVC = TabBarController()
                    self.navigationController?.pushViewController(tabVC, animated: true)
                }
            }
            
        }
    }
}
