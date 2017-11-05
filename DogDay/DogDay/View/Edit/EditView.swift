//
//  EditView.swift
//  DogDay
//
//  Created by david on 2017. 11. 5..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class EditView: BaseView<EditViewController> {
    
    enum PickerType {
        case date
        case time
    }
    
    private let popButton = UIButton(type: .custom)
    private let registerButton = UIButton(type: .custom)
    
    var scrollView: GradientScrollView!
    let previousButton = UIButton()
    let nextButton = UIButton()
    let titleTextField = DogDayTextField()
    let dateTextField = DogDayTextField()
    let timeTextField = DogDayTextField()
    let widgetSwitch = UISwitch()
    
    override func setupUI() {
        
        vc.navigationController?.setNavigationBarHidden(false, animated: false)
        vc.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        vc.navigationController?.clearBackgroundColor()
        
        vc.navigationItem.title = "일정추가"
        popButton.setImage(#imageLiteral(resourceName: "add_back"), for: .normal)
        registerButton.setImage(#imageLiteral(resourceName: "add_check"), for: .normal)
        registerButton.isEnabled = false
        registerButton.alpha = 0.38
        
        let baseScrollView = UIScrollView()
        let contentsView = UIView()
        let dateTitleLabel = UILabel()
        let timeTitleLabel = UILabel()
        let widgetLabel = UILabel()
        let widgetDescriptionTitleLabel = UILabel()
        let widgetDescriptionDetailLabel = UILabel()
        
        scrollView = GradientScrollView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: self.frame.width,
                                                      height: CGFloat(472)),
                                        gradientColors: [UIColor(red: 248, green: 143, blue: 179),
                                                         UIColor(red: 128, green: 203, blue: 196),
                                                         UIColor(red: 255, green: 166, blue: 166),
                                                         UIColor(red: 123, green: 197, blue: 216),
                                                         UIColor(red: 79, green: 195, blue: 247)])
        scrollView.addContentsViews(images: [#imageLiteral(resourceName: "detail_beauty"), #imageLiteral(resourceName: "detail_heart"), #imageLiteral(resourceName: "detail_pill"), #imageLiteral(resourceName: "detail_Animal Hospital"), #imageLiteral(resourceName: "detail_Vaccination"), #imageLiteral(resourceName: "detail_beauty"), #imageLiteral(resourceName: "detail_heart")])
        
        contentsView.addSubviews([scrollView,
                                  previousButton,
                                  nextButton,
                                  titleTextField,
                                  dateTitleLabel,
                                  dateTextField,
                                  timeTitleLabel,
                                  timeTextField,
                                  widgetLabel,
                                  widgetSwitch,
                                  widgetDescriptionTitleLabel,
                                  widgetDescriptionDetailLabel])
        baseScrollView.addSubview(contentsView)
        self.addSubview(baseScrollView)
        
        baseScrollView.backgroundColor = UIColor.white
        
        previousButton.setImage(#imageLiteral(resourceName: "add_back"), for: .normal)
        nextButton.setImage(#imageLiteral(resourceName: "add_next"), for: .normal)
        
        titleTextField.backgroundColor = UIColor.textFieldBackGroundColor
        titleTextField.placeholder = "제목을 입력하세요"
        titleTextField.font = UIFont.main0_regular
        titleTextField.textColor = UIColor.white
        titleTextField.tintColor = UIColor.white
        titleTextField.returnKeyType = .done
        
        dateTitleLabel.text = "날짜"
        dateTitleLabel.font = UIFont.main0_medium
        dateTitleLabel.textColor = UIColor.subTextWhiteColor
        
        dateTextField.backgroundColor = UIColor.textFieldBackGroundColor
        dateTextField.placeholder = "날짜"
        dateTextField.font = UIFont.main0_regular
        dateTextField.textColor = UIColor.white
        dateTextField.tintColor = UIColor.white
        
        timeTitleLabel.text = "시간"
        timeTitleLabel.font = UIFont.main0_medium
        timeTitleLabel.textColor = UIColor.subTextWhiteColor
        
        timeTextField.backgroundColor = UIColor.textFieldBackGroundColor
        timeTextField.placeholder = "시간"
        timeTextField.font = UIFont.main0_regular
        timeTextField.textColor = UIColor.white
        timeTextField.tintColor = UIColor.white
        
        widgetLabel.text = "위젯설정"
        widgetLabel.font = UIFont.main0_medium
        widgetLabel.textColor = UIColor.subTextWhiteColor
        
        widgetSwitch.onTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16)
        widgetSwitch.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        widgetSwitch.setOn(false, animated: false)
        
        widgetDescriptionTitleLabel.text = "위젯 안내"
        widgetDescriptionTitleLabel.font = UIFont.main2_regular
        widgetDescriptionTitleLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.28)
        
        widgetDescriptionDetailLabel.text = "아이폰위젯(편집)에서 앱을 추가하여 사용할때 현재 앱을 위젯에 표시할지를 켜고 끄는 설정입니다."
        widgetDescriptionDetailLabel.font = UIFont.main3_regular
        widgetDescriptionDetailLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        widgetDescriptionDetailLabel.numberOfLines = 0
        
        // MARK: Constraints
        baseScrollView
            .topAnchor(to: self.topAnchor)
            .leadingAnchor(to: self.leadingAnchor)
            .trailingAnchor(to: self.trailingAnchor)
            .bottomAnchor(to: self.bottomAnchor)
            .activateAnchors()
        
        contentsView
            .topAnchor(to: baseScrollView.topAnchor)
            .leadingAnchor(to: baseScrollView.leadingAnchor)
            .trailingAnchor(to: baseScrollView.trailingAnchor)
            .bottomAnchor(to: baseScrollView.bottomAnchor)
            .equalWidthAnchor(to: baseScrollView.widthAnchor)
            .equalHeightAnchorContentsView(to: baseScrollView.heightAnchor)
            .activateAnchors()
        
        previousButton
            .topAnchor(to: scrollView.topAnchor, constant: CGFloat(143))
            .leadingAnchor(to: scrollView.leadingAnchor, constant: CGFloat(26))
            .dimensionAnchors(width: CGFloat(44), height: CGFloat(44))
            .activateAnchors()
        
        nextButton
            .topAnchor(to: previousButton.topAnchor)
            .trailingAnchor(to: scrollView.trailingAnchor, constant: CGFloat(-26))
            .dimensionAnchors(width: CGFloat(44), height: CGFloat(44))
            .activateAnchors()
        
        titleTextField
            .topAnchor(to: previousButton.bottomAnchor, constant: CGFloat(60))
            .leadingAnchor(to: scrollView.leadingAnchor, constant: CGFloat(28))
            .trailingAnchor(to: scrollView.trailingAnchor, constant: CGFloat(-28))
            .heightAnchor(constant: CGFloat(42))
            .activateAnchors()
        
        dateTitleLabel
            .topAnchor(to: titleTextField.bottomAnchor, constant: CGFloat(24))
            .leadingAnchor(to: titleTextField.leadingAnchor)
            .activateAnchors()
        
        dateTextField
            .topAnchor(to: dateTitleLabel.bottomAnchor, constant: CGFloat(6))
            .leadingAnchor(to: dateTitleLabel.leadingAnchor)
            .trailingAnchor(to: timeTextField.leadingAnchor, constant: CGFloat(-24))
            .heightAnchor(constant: CGFloat(42))
            .activateAnchors()
        
        timeTitleLabel
            .topAnchor(to: dateTitleLabel.topAnchor)
            .leadingAnchor(to: timeTextField.leadingAnchor)
            .activateAnchors()
        
        timeTextField
            .topAnchor(to: dateTextField.topAnchor)
            .trailingAnchor(to: scrollView.trailingAnchor, constant: CGFloat(-28))
            .widthAnchor(constant: CGFloat(120))
            .heightAnchor(constant: CGFloat(42))
            .activateAnchors()
        
        widgetLabel
            .topAnchor(to: timeTextField.bottomAnchor, constant: CGFloat(30))
            .leadingAnchor(to: dateTextField.leadingAnchor)
            .activateAnchors()
        
        widgetSwitch
            .trailingAnchor(to: scrollView.trailingAnchor, constant: CGFloat(-28))
            .centerYAnchor(to: widgetLabel.centerYAnchor)
            .activateAnchors()
        
        widgetDescriptionTitleLabel
            .topAnchor(to: scrollView.bottomAnchor, constant: CGFloat(20))
            .leadingAnchor(to: dateTextField.leadingAnchor)
            .activateAnchors()
        
        widgetDescriptionDetailLabel
            .topAnchor(to: widgetDescriptionTitleLabel.bottomAnchor, constant: CGFloat(6))
            .leadingAnchor(to: widgetDescriptionTitleLabel.leadingAnchor)
            .trailingAnchor(to: timeTextField.trailingAnchor)
            .bottomAnchor(to: contentsView.bottomAnchor, constant: CGFloat(0))
            .activateAnchors()
        
    }
    
    override func setupBinding() {
        popButton.addTarget(vc, action: #selector(vc.popButtonDidTab(_:)), for: .touchUpInside)
        registerButton.addTarget(vc, action: #selector(vc.registerButtonDidTab(_:)), for: .touchUpInside)
        vc.navigationItem.setLeftBarButton(UIBarButtonItem(customView:popButton), animated: false)
        vc.navigationItem.setRightBarButton(UIBarButtonItem(customView:registerButton), animated: false)
        
        previousButton.addTarget(vc, action: #selector(vc.previousButtonDidTab(_:)), for: .touchUpInside)
        nextButton.addTarget(vc, action: #selector(vc.nextButtonDidTab(_:)), for: .touchUpInside)
        
        addToolBar(to: dateTextField, type: .date)
        addToolBar(to: timeTextField, type: .time)
        
        scrollView.delegate = vc
        titleTextField.delegate = vc
    }
    
    private func addToolBar(to textField: UITextField, type: PickerType) {
        let datePicker = UIDatePicker()
        datePicker.locale = Locale(identifier: "ko")
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 0, green: 118, blue: 255)
        toolBar.sizeToFit()
        
        var doneButtonSelector: Selector!
        switch type {
        case .date:
            doneButtonSelector = #selector(vc.datePickerDoneButtonDidTab(_:))
            datePicker.datePickerMode = .date
            break
            
        case .time:
            doneButtonSelector = #selector(vc.timePickerDoneButtonDidTab(_:))
            datePicker.datePickerMode = .time
            break
        }
        
        let doneButton = UIBarButtonItem(title: "확인", style: .plain, target: vc, action: doneButtonSelector)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: vc, action: #selector(vc.cancelButtonDidTab(_:)))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        textField.inputAccessoryView = toolBar
        textField.inputView = datePicker
    }
}
