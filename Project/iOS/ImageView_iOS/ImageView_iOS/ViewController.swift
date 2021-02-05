//
//  ViewController.swift
//  ImageView_iOS
//
//  Created by Derrick on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    //----------------------------------------------------
    //fields
    
    // Image View
    @IBOutlet weak var imgView: UIImageView!
    
    // Button Name 변경을 위해서
    @IBOutlet weak var btnResize: UIButton!
    
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
        // 첫화면 구상을 잘해야 한다.
        // 1. Image 그려보고(xml) -> 실행  2. viewDidLoad에 넣고 -> 실행 3. 다시 코드짜기
        
        // 이미지 파일 연결
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // 1) 첫화면 띄우기 위한 절차
        // imgView에 image 할당
        imgView.image = imgOn
        
    }
    
    
    //Action
    
    // Buttton Action
    //버튼이 하나니까 -> 1. true / false 로 하거나 2. count = 0, 1로 하는 걸 해야한다.
    @IBAction func btnResizeImage(_ sender: UIButton) {
        // Image Size를 두배로 !
        // Float니까 당연히 실수
        let scale: CGFloat = 2.0
        // 넓이
        var newWidth: CGFloat
        // 높이
        var newHeight: CGFloat
        
        // 이미지 확대
        if isZoom {
            // 현재 크기 * scale
            newWidth = imgView.frame.width / scale
            // 현재 높이 * scale
            newHeight = imgView.frame.height / scale

            // img Button Name 변경하기
            // for: .normal : normal 은 현재 것.<- 시스템에 enum을 쓰는 것이다.
            btnResize.setTitle("Image 확대", for: .normal)
            
        }
       // 이미지 축소
        else{
            // 현재 크기 * scale
            newWidth = imgView.frame.width * scale
            // 현재 높이 * scale
            newHeight = imgView.frame.height * scale
            
            // img Button Name 변경하기
            // for: .normal : normal 은 현재 것.<- 시스템에 enum을 쓰는 것이다.
            btnResize.setTitle("Image 축소", for: .normal)
        }
        // image size 적용하기 -> Design
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        // 확대 됬으면 True 값으로 바꿔야 하기때문에
        // not isZoom
        isZoom = !isZoom
    }
    
    // Switch Action
    // _ sender 변수가 On/Off를 구별한다. -> true,false로 알려줌
    @IBAction func switchImageOnOff(_ sender: UISwitch) {

        /// --------
        // switch 문
        /// --------
        switch sender.isOn {
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }

        /// --------
        // if 문
        /// --------
//        // 전구 켜질때
//        if sender.isOn {
//            imgView.image = imgOn
//        }
//        // 전구 꺼질때
//        else{
//            imgView.image = imgOff
//        }
    }
    
    
    
} // ----END

