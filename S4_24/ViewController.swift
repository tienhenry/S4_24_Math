//
//  ViewController.swift
//  S4_24
//
//  Created by admin on 9/20/16.
//  Copyright © 2016 tien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblP1: UILabel!
    @IBOutlet var lblP2: UILabel!
    
    @IBOutlet var buttonP1: UIButton!
    @IBOutlet var butonP2: UIButton!
    @IBOutlet var buttonP3: UIButton!
    
    @IBOutlet var labelRight: UILabel!
    @IBOutlet var labelWrong: UILabel!
    @IBOutlet var labelTime: UILabel!
    
    var dung:Int = 0
    var sai:Int = 0
    var time:Int = 10
    var ketQua:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timeout), userInfo: nil, repeats: true)
        
        setRandom()
        
    }
    func timeout() {
        
        time = time - 1
        labelTime.text = "Time : \(time)"
        
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        
        print(ketQua)
        if ketQua == Int((sender.titleLabel?.text!)!) {
            
            dung = dung + 1
            labelRight.text = "Right : \(dung)"
            
        } else {
            
            sai = sai + 1
            labelWrong.text = "Wrong : \(sai)"
        }
        
        setRandom()
        time = 10
    }
    
    func setRandom() {
        // Lấy ra 2 số ngẫu nhiên
        let random1 = Int(arc4random_uniform(4)) + 1// random ra từ số 1-4
        
        let random2 = Int(arc4random_uniform(4)) + 1 // random ra từ số 1-4
        
        // print("\(random1) \(random2)")
        // Hiện thị 2 số ngẫu nhiên lên viewsetRandom
        
        lblP1.text = String(random1)
        lblP2.text = String(random2)
        ketQua = Int(random1) + Int(random2)
        setResult(random1, randomB: random2)
        
    }
    
// Hien thi ket qua
    func setResult(randomA: Int, randomB: Int) {
        
        let randomPlace = Int(arc4random_uniform(2))
        
        print(randomPlace)
        
        if(randomPlace == 0) { // Tổng vào button 1
            
            buttonP3.setTitle(String(randomB), forState: .Normal)
            butonP2.setTitle(String(randomA), forState: .Normal)
            buttonP1.setTitle(String(sum(randomA, p2: randomB)), forState: .Normal)
        }
        if(randomPlace == 1) { // Tổng vào button 2
            
            buttonP1.setTitle(String(randomA), forState: .Normal)
            buttonP3.setTitle(String(randomB), forState: .Normal)
            butonP2.setTitle(String(sum(randomA, p2: randomB)), forState: .Normal)
        }
        if(randomPlace == 2) { // Tổng vào button 3
            
            buttonP1.setTitle(String(randomA), forState: .Normal)
            butonP2.setTitle(String(randomB), forState: .Normal)
            buttonP3.setTitle(String(sum(randomA, p2: randomB)), forState: .Normal)
            
        }

    }
// Tinh tong
    func sum(p1: Int, p2: Int) -> Int {
    
        return p1+p2;
    
    }

}









