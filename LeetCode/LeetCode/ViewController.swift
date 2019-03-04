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

// MARK: Median of Two Sorted Arrays

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var tempArray = nums1 + nums2;
        tempArray = tempArray.sorted();
        
        let count:Int = tempArray.count
        
        if count % 2 == 0 {
            let num1:Int = tempArray[count/2]
            let num2:Int = tempArray[count/2 - 1]
            return Double((num1 + num2))/2.0
        } else {
            return Double(tempArray[count/2])
        }
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

