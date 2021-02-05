//
//  ViewController.swift
//  Quiz051_imageView
//
//  Created by Derrick on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    //----------
    //fields
    //----------

    // imageView
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var switchResizeImg: UISwitch!
    // 이미지 연결을 위한 변수
    // 켜진 전구 이미지
    var imgOn: UIImage?
    // 꺼진 전구 이미지
    var imgOff: UIImage?
    
    // 이미지 확대 / 축소
    // 왜 false냐? 처음에 이미지가 확대된 상태가 아니기 때문
    // 이미지 확대 여부
    var isZoom = false
    
    //----------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 파일 연결
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // 1) 첫화면 띄우기 위한 절차
        // imgView에 image 할당
        imgView.image = imgOn
        switchResizeImg.isOn = false


    }
    //----------
    //Actions
    //----------
    
    // Resize
    @IBAction func switchResize(_ sender: UISwitch) {
        // Image Size를 두배로 !
        // Float니까 당연히 실수
        let scale: CGFloat = 2.0
        // 넓이
        var newWidth: CGFloat
        // 높이
        var newHeight: CGFloat
        
        // 이미지 확대
        switch isZoom {
        
        case true:
            // 현재 크기 * scale
            newWidth = imgView.frame.width / scale
            // 현재 높이 * scale
            newHeight = imgView.frame.height / scale

        // 이미지 축소
        default:
            // 현재 크기 * scale
            newWidth = imgView.frame.width * scale
            // 현재 높이 * scale
            newHeight = imgView.frame.height * scale
            
        }
        
        // image size 적용하기 -> Design
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        // 확대 됬으면 True 값으로 바꿔야 하기때문에
        // not isZoom
        isZoom = !isZoom
    }
    
    // Switch Action
    // _ sender 변수가 On/Off를 구별한다. -> true,false로 알려줌
    @IBAction func switchLight(_ sender: UISwitch) {
        /// --------
        // switch 문
        /// --------
        switch sender.isOn {
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }

    }
    
}

