//
//  EmptyMainView.swift
//  DogDay
//
//  Created by david on 2017. 10. 22..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class EmptyMainView: BaseView<MainViewController> {

    override func setupUI() {
        //view controller
        vc.navigationController?.setNavigationBarHidden(true, animated: false)
        //root view
        backgroundColor = UIColor.emptyBackgroundColor
        //label
        let titleLabel = UILabel()
        titleLabel.attributedText = UIFont.title0Text("반려견의 일정을\n등록해 보세요!")
        titleLabel.font = UIFont.title0
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        let mainLabel = UILabel()
        mainLabel.attributedText = UIFont.main1Text("효율적인 일정 관리\n쉬운 일정 등록\n위젯 설정으로 스케줄 관리까지")
        mainLabel.font = UIFont.main1
        mainLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .center
        
        let addDayButton = HHOButton(type: .custom)
        addDayButton.setTitle("등록하기", for: .normal)
        addDayButton.setTitleColor(UIColor.emptyAddButtonColor, for: .normal)
        addDayButton.setTitleColor(UIColor.darkerColor(currentColor: UIColor.emptyAddButtonColor), for: .highlighted)
        addDayButton.titleLabel?.textAlignment = .center
        addDayButton.titleLabel?.font = UIFont.main0Text_medium
        addDayButton.setImage(#imageLiteral(resourceName: "add_day_btn"), for: .normal)
        
        addDayButton.defaultBackgroundColor = UIColor.white
        addDayButton.highlightedBackgroundColor = UIColor.darkerColor(currentColor: UIColor.white)
        addDayButton.backgroundColor = addDayButton.defaultBackgroundColor
        
        addDayButton.layer.cornerRadius = 9.0
        addDayButton.layer.shadowColor = UIColor.black.cgColor
        addDayButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        addDayButton.layer.shadowOpacity = 0.14;
        addDayButton.layer.shadowRadius = 4.0;
        
        addDayButton.addTarget(vc, action: #selector(vc.addDayButtonDidTab), for: .touchUpInside)
//        116 46
        
        self.addSubviews([titleLabel, mainLabel, addDayButton])
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(163.0)
            make.centerX.equalTo(self)
        }
        
        mainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(18.0)
            make.centerX.equalTo(self)
        }
        
        addDayButton.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel.snp.bottom).offset(52.0)
            make.height.equalTo(46.0)
            make.width.equalTo(116.0)
            make.centerX.equalTo(self)
        }
        
        //button
        
//            {
//                deadlineDateLabel.snp.makeConstraints { (make) -> Void in
//                    make.top.equalTo(contentView.snp.top).offset(UI.baseMargin)
//                    make.leading.equalTo(contentView.snp.leading).offset(UI.baseMargin)
//                }
//
//                remainingDaysLabel.snp.makeConstraints { (make) -> Void in
//                    make.top.equalTo(contentView.snp.top).offset(UI.baseMargin)
//                    make.trailing.equalTo(contentView.snp.trailing).inset(UI.baseMargin)
//                }
//
//                nameLabel.snp.makeConstraints { (make) -> Void in
//                    make.top.equalTo(deadlineDateLabel.snp.bottom).offset(UI.baseMargin)
//                    make.leading.equalTo(deadlineDateLabel.snp.leading).offset(0)
//                }
//
//                iconImageView.snp.makeConstraints { (make) -> Void in
//                    make.top.equalTo(deadlineDateLabel.snp.bottom).offset(UI.baseMargin)
//                    make.trailing.equalTo(remainingDaysLabel.snp.trailing).offset(0)
//                }
//
//        }

    }

    override func setupBinding() {
        
    }
}
