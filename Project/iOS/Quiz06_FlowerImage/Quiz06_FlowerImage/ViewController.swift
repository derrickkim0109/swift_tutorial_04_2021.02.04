//
//  ViewController.swift
//  Quiz06_FlowerImage
//
//  Created by Derrick on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    //--------
    // fields
    //--------
    
    // File Name
    @IBOutlet weak var lblFileName: UILabel!
    // Images
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이미지 파일 연결
        imgOn = UIImage(named: imageName[numImage])
        imgView.image = imgOn
        
        // 첫이미지 이름 저장
        lblFileName.text = "\(imageName[0])"
    }
    //--------
    // Actions
    //--------
    
    // Previous
    @IBAction func btnPrevious(_ sender: UIButton) {
        numImage -= 1
        if numImage < 0 {
            numImage = imageName.count - 1
        }
        displayImage(number: numImage)
    }
    // Next
    @IBAction func btnNext(_ sender: UIButton) {
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
       
        
    }///END


