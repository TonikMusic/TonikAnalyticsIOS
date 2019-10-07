//
//  Created by Student Loaner 3 on 10/5/19.
//  Copyright © 2019 HazeWritesCode. All rights reserved.
//
import Foundation

/*
    ***FACTORY METHODS***
 
    NOTE: This extension will take care of creating views
 
*/
extension LoginSignupViewController {
    
    func createLoginSignUpView() -> LoginSignUpView {
        let loginSignUpView = LoginSignUpView()
        return loginSignUpView
    }
    
    func createLogoView() -> LogoView {
        let logoView = LogoView()
        return logoView
    }
    
    func createDontHaveAccountlable() -> Label {
        let label = Label.newLabel(title: "Don't have an account?", textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), textSize: 16)
        return label
    }
    
    func createButton() -> Button {
        let button = Button.customButton(title: "Sign Up", titleColor: #colorLiteral(red: 0.3921568627, green: 0.01960784314, blue: 0.5607843137, alpha: 1), cornerRadius: 0, backgroundColor: .clear)
        return button
    }
    
    func createLoginSignUpBtn() -> Button {
        let button = Button.customButton(title: "Log In", titleColor: .white, cornerRadius: 30, backgroundColor: #colorLiteral(red: 0.3921568627, green: 0.01960784314, blue: 0.5607843137, alpha: 1))
        return button
    }
}


/*
  NOTE: This extension will take of layingout subViews
*/

extension LoginSignupViewController {
    
    // NOTE: This is going to be the main caller function for layingout all subviews
    func layout() {
        layoutLoginSingUpView()
        layoutLogoView()
        layoutloginSignUpBtn()
        layoutDontHaveAccountlable()
        layoutCreateAccountBtn()
    }
    
    
    func layoutLoginSingUpView() {
        
        view.addSubview(loginSignupView)
        loginSignupView.translatesAutoresizingMaskIntoConstraints = false
        loginSignupView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        loginSignupView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        addYAxisToLoginSignupView = loginSignupView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: viewCenterY / 5 - 30)
        addYAxisToLoginSignupView.isActive = true
        addHeightPaddingToLoginSignupView = loginSignupView.heightAnchor.constraint(equalToConstant: viewHeight / 3 + 30)
        addHeightPaddingToLoginSignupView.isActive = true
    }
    

    
    func layoutLogoView() {
        view.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        addYAxisToLogoView = logoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -(viewCenterY / 6) * 2)
        addYAxisToLogoView.isActive = true
        logoView.leadingAnchor.constraint(equalTo: loginSignupView.leadingAnchor, constant: 10).isActive = true
        logoView.trailingAnchor.constraint(equalTo: loginSignupView.trailingAnchor, constant: -10).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func layoutloginSignUpBtn() {
        view.addSubview(loginSignUpBtn)
        loginSignUpBtn.dropShadow()
        loginSignUpBtn.translatesAutoresizingMaskIntoConstraints = false
        loginSignUpBtn.leadingAnchor.constraint(equalTo: loginSignupView.leadingAnchor, constant: 20).isActive = true
        loginSignUpBtn.trailingAnchor.constraint(equalTo: loginSignupView.trailingAnchor, constant: -20).isActive = true
        loginSignUpBtn.centerXAnchor.constraint(equalTo: loginSignupView.centerXAnchor, constant: 0).isActive = true
        loginSignUpBtn.centerYAnchor.constraint(equalTo: loginSignupView.bottomAnchor, constant: 0).isActive = true
        loginSignUpBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func layoutDontHaveAccountlable() {
        view.addSubview(dontHaveAccountlable)
        dontHaveAccountlable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        dontHaveAccountlable.leadingAnchor.constraint(equalTo: loginSignupView.leadingAnchor, constant: viewWidth/45).isActive = true
        dontHaveAccountlable.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func layoutCreateAccountBtn() {
        view.addSubview(createAccountBtn)
        createAccountBtn.centerYAnchor.constraint(equalTo: dontHaveAccountlable.centerYAnchor, constant: 0).isActive = true
        createAccountBtn.trailingAnchor.constraint(equalTo: loginSignupView.trailingAnchor, constant: -15).isActive = true
        createAccountBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        createAccountBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        createAccountBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
