//
//  CSTabBarController.swift
//  Custom-CSTabBar
//
//  Created by 윤성호 on 12/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class CSTabBarController: UITabBarController {
    
    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        // 기존의 탭 바 숨기기
        self.tabBar.isHidden = true
        
        // 커스텀 탭 바 구현
        self.newTabBar()
    }
    
    // 새로운 탭 바 정의하는 메소드
    func newTabBar(){
        
        // 기준 좌표와 크기를 정의
        let width = self.view.frame.width
        let height: CGFloat = 50
        let x: CGFloat = 0
        let y = self.view.frame.height - height
        
        // 새로운 뷰의 속성을 설정
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = .brown
        
        self.view.addSubview(csView)
        
        // 버튼의 너비와 높이를 설정
        let tabBtnWidht = self.csView.frame.width / 3
        let tabBtnHeight = self.csView.frame.height
        
        // 버튼의 영역을 설정
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabBtnWidht, height: tabBtnHeight)
        self.tabItem02.frame = CGRect(x: tabBtnWidht, y: 0, width: tabBtnWidht, height: tabBtnHeight)
        self.tabItem03.frame = CGRect(x: tabBtnWidht * 2, y: 0, width: tabBtnWidht, height: tabBtnHeight)
        
        // 버튼의 공통 속성을 설정하고 뷰에 추가
        self.addTabBarBtn(btn: self.tabItem01, title: "첫 번째 버튼", tag: 0)
        self.addTabBarBtn(btn: self.tabItem02, title: "두 번째 버튼", tag: 1)
        self.addTabBarBtn(btn: self.tabItem03, title: "세 번째 버튼", tag: 2)
        
        // 기본값 tabItem01로 설정
        self.onTabBarItemClick(self.tabItem01)
    }
    
    // 버튼의 공통 속성을 정의하기 위한 메소드
    func addTabBarBtn(btn: UIButton, title: String, tag: Int){
        
        // 버튼의 타이틀과 태그값
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        // 버튼의 텍스트 색상을 일반 상태와 선택된 상태로 나누어 설정
        btn.setTitleColor(.white, for: .normal)         // 일반 상태의 버튼 색상
        btn.setTitleColor(.yellow, for: .selected)      // 선택되었을 때의 버튼 색상
        
        // 버튼에 액션 메소드 연결
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        
        // csView에 버튼을 추가
        self.csView.addSubview(btn)
    }
    
    // 버튼을 클릭했을 때 호출되는 메소드
    @objc func onTabBarItemClick(_ sender: UIButton){
        
        // 모든 버튼을 선택되지 않은 상태로 초기화 처리
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        
        // 인자값으로 입력된 버튼만 선택된 상태로 변경
        sender.isSelected = true
        
        // 버튼에 설정된 태그값을 사용하여 뷰 컨트롤러를 전환
        self.selectedIndex = sender.tag
    }

}
