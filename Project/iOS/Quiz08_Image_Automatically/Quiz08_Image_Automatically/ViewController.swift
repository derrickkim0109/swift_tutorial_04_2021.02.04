//
//  ViewController.swift
//  Quiz08_Image_Automatically
//
//  Created by Derrick on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    //----------
    // fields
    //----------
    
    //File Name
    @IBOutlet weak var lblFileName: UILabel!
    // Image
    @IBOutlet weak var imgView: UIImageView!
    
    // 이미지 연결을 위한 변수
    // 첫 이미지 사진
    var imgOn: UIImage?
    // 이미지 이름 넣을 Array
    var imageName: [String] = [
                                 "flower_01.png",
                                 "flower_02.png",
                                 "flower_03.png",
                                 "flower_04.png",
                                 "flower_05.png",
                                 "flower_06.png"
    ]
    var numImage = 0
    
    // AsyncTask 쓸 때 많이 쓰는 변수.
    // Object C 와 연결 시켜주는 것이다.
    let timeSelctor: Selector = #selector(ViewController.autoImage)
    // updateTime 은 object C Type으로 만들어야 한다.
    
    // 시간 interval을 1초로 주겠다.
    // 초 바뀔 때마다 자동으로 메소드를 수행하기 위해.
    let interval = 3.0
    
    var currentTime = ""
    var alarmTime = ""
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지 파일 연결
        imgOn = UIImage(named: imageName[numImage])
        imgView.image = imgOn
        
        // 첫이미지 이름 저장
        lblFileName.text = "\(imageName[0])"
        // updateTime 실행 시키기
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelctor, userInfo: nil, repeats: true)



    }
    //--------
    // Actions
    //--------
   
    @objc func autoImage(){
        numImage += 1
        if numImage >= imageName.count {
            numImage = 0
        }
        displayImage(number: numImage)
        
    }
    // 배열 번지 값을 가져오기 위한 함수
    func displayImage(number: Int){
        imgView.image = UIImage(named: imageName[number])
        lblFileName.text = imageName[number]
    }
    

}

