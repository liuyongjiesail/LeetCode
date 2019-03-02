//
//  ViewController.swift
//  LeetCode
//
//  Created by 刘永杰 on 2019/3/1.
//  Copyright © 2019 刘永杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(Solution())
        // Do any additional setup after loading the view, typically from a nib.
    }


}


// MARK: Longest Substring Without Repeating Characters

//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//
//        var tempString = ""
//        var longest = 0
//
//        for char in s.characters {
//            if tempString.contains(char) {
//                var sameIndex = tempString.index(of: char);
//                sameIndex = tempString.index(sameIndex!, offsetBy: 1);
//                tempString = String(tempString.suffix(from: sameIndex!));
//            }
//            tempString = tempString + String(char);
//            if tempString.count > longest {
//                longest = tempString.count;
//            }
//        }
//        return longest;
//    }
//}

//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//
//        var longest = 0
//        var tempDictionary = [Character:Int]()
//        var moveIndex = 0;
//        let charArray = Array(s)
//
//        for index in 0..<charArray.count {
//            let tempChar = charArray[index]
//            let tempIndex = tempDictionary[tempChar]
//            if (tempIndex != nil) {
//                if tempIndex! >= moveIndex {
//                    moveIndex = tempIndex! + 1;
//                }
//            }
//            tempDictionary[tempChar] = index;
//            longest = max(index - moveIndex + 1, longest)
//
//        }
//        return longest;
//    }
//}

