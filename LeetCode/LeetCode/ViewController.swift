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
        
        print(Solution().longestPalindrome("aaabaaaaaa"))
        // Do any additional setup after loading the view, typically from a nib.
    }


}

// MARK: Longest Palindromic Substring

class Solution {
    
    func longestPalindrome(_ s: String) -> String {
        
        let charArray = Array(s)
        var longestPalindrome = String()
        
        if charArray.count == 0 {
            return ""
        }
        if charArray.count == 1 {
            return s
        }
        
        longestPalindrome = String(charArray[0])
        
        for i in 0..<charArray.count {
            
            var tempString:String = centerExtend(s, i, i)
            
            if tempString.count > longestPalindrome.count {
                longestPalindrome = tempString;
            }
            
            tempString = centerExtend(s, i, i+1)
            
            if tempString.count > longestPalindrome.count {
                longestPalindrome = tempString;
            }
            
        }
        
        return longestPalindrome
    }
    
    func centerExtend(_ s: String, _ left: Int, _ right: Int) -> String {
        
        let charArray = Array(s)
        var currentLeft:Int = left
        var currentRight:Int = right
        
        while currentLeft >= 0 && currentRight <= s.count - 1 && charArray[currentLeft] == charArray[currentRight] {
            currentLeft -= 1
            currentRight += 1
        }
        
        return String(charArray[currentLeft+1..<currentRight])
    }
    
}

//class Solution {
//
//    func longestPalindrome(_ s: String) -> String {
//
//        var maxPalinLength = 0
//        var longestPalindrome = String()
//        let charArray = Array(s)
//
//        var tempArray = Array<Int>()
//        var doubleArray = Array<Array<Int>>()
//
//        for _ in 0..<charArray.count {
//            tempArray.append(1)
//        }
//
//        for _ in 0..<charArray.count {
//            doubleArray.append(tempArray)
//        }
//
//        longestPalindrome = String(charArray[0])
//
//        print(doubleArray)
//
//        for i in 0...charArray.count - 2 {
//            if charArray[i] == charArray[i+1] {
//                doubleArray[i][i+1] = 1
//                longestPalindrome = String(charArray[i..<i+2])
//            }
//        }
//        print("==="+longestPalindrome)
//        print(doubleArray)
//
//        for l in 2...charArray.count {
//            for i in 0...charArray.count - l {
//                let j = i + l - 1
//                if charArray[i] == charArray[j] {
//                    doubleArray[i][j] = doubleArray[i+1][j-1]
//                    if doubleArray[i][j] == 1 && l > maxPalinLength {
//                        longestPalindrome = String(charArray[i..<j+1])
//                    }
//                } else {
//                    doubleArray[i][j] = 0;
//                }
//            }
//        }
//
//        return longestPalindrome
//    }
//
//}

//class Solution {
//
//    func longestPalindrome(_ s: String) -> String {
//
//        var maxPalinLength = 0
//        let charArray = Array(s)
//
//        if charArray.count < 1 {
//            return ""
//        }
//
//        var longestPalindrome = String(charArray[0])
//
//        if charArray.count == 1 {
//            return s
//        }
//        if charArray.count == 2 && charArray[0] != charArray[1] {
//            return String(charArray[0])
//        }
//
//        for i in 0..<charArray.count {
//            for j in i+1..<charArray.count {
//                let length = j - i
//                let currentString = String(charArray[i..<j+1])
//                print("\n==" + currentString)
//                if isPalindrome(currentString) {
//                    if length > maxPalinLength {
//                        longestPalindrome = currentString
//                        maxPalinLength = length;
//                    }
//                }
//            }
//        }
//
//        return longestPalindrome;
//    }
//
//    func isPalindrome(_ s: String) -> Bool {
//        var charArray = Array(s)
//        let count = charArray.count
//        for i in 0..<count-1 {
//            if charArray[i] != charArray[count - 1 - i] {
//                return false
//            }
//        }
//        return true
//    }
//}

// MARK: Median of Two Sorted Arrays

//class Solution {
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//
//        var maxNumber:Int = 0
//        var minNumber:Int = 0
//        var maxArray = Array<Int>()
//        var minArray = Array<Int>()
//
//        if nums1.count > nums2.count {
//            maxNumber = nums1.count
//            minNumber = nums2.count
//            maxArray = nums1
//            minArray = nums2
//        } else {
//            maxNumber = nums2.count
//            minNumber = nums1.count
//            maxArray = nums2
//            minArray = nums1
//        }
//
//        var iMin = 0
//        var iMax = minNumber
//        let halfLength = (maxNumber + minNumber + 1)/2
//
//        while iMin <= iMax {
//            let i = (iMin + iMax)/2
//            let j = halfLength - i
//            if i < iMax && maxArray[j-1] > minArray[i] {
//                iMin = i + 1
//            } else if i > iMin && minArray[i-1] > maxArray[j] {
//                iMax = i - 1
//            } else {
//                var maxLeft = 0
//                if i == 0 {
//                    maxLeft = maxArray[j-1]
//                } else if j == 0 {
//                    maxLeft = minArray[i-1]
//                } else {
//                    maxLeft = max(minArray[i-1], maxArray[j-1])
//                }
//                if (maxNumber + minNumber) % 2 == 1 {
//                    return Double(maxLeft)
//                }
//                var minRight = 0
//                if i == minNumber {
//                    minRight = maxArray[j]
//                } else if j == maxNumber {
//                    minRight = minArray[i]
//                } else {
//                    minRight = min(maxArray[j], minArray[i])
//                }
//                return Double((maxLeft + minRight)) / 2.0
//            }
//        }
//
//        return 0.1;
//    }
//}

//class Solution {
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//
//        var i1 = nums1.startIndex
//        var i2 = nums2.startIndex
//        var resultArray = Array<Int>()
//
//        while i1 < nums1.endIndex && i2 < nums2.endIndex {
//
//            let num1 = nums1[i1];
//            let num2 = nums2[i2];
//
//            if num1 < num2 {
//                resultArray.append(num1)
//                i1 = nums1.index(i1, offsetBy: 1)
//            } else {
//                resultArray.append(num2)
//                i2 = nums2.index(i2, offsetBy: 1)
//            }
//        }
//
//        if i1 < nums1.endIndex {
//            resultArray += nums1[i1..<nums1.endIndex]
//        }
//        if i2 < nums2.endIndex {
//            resultArray += nums2[i2..<nums2.endIndex]
//        }
//
//        // 排序完成以后
//        let count:Int = resultArray.count
//
//        if count % 2 == 0 {
//            let num1:Int = resultArray[count/2]
//            let num2:Int = resultArray[count/2 - 1]
//            return Double((num1 + num2))/2.0
//        } else {
//            return Double(resultArray[count/2])
//        }
//    }
//}

//class Solution {
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//
//        var tempArray = nums1 + nums2;
//        tempArray = tempArray.sorted();
//
//        let count:Int = tempArray.count
//
//        if count % 2 == 0 {
//            let num1:Int = tempArray[count/2]
//            let num2:Int = tempArray[count/2 - 1]
//            return Double((num1 + num2))/2.0
//        } else {
//            return Double(tempArray[count/2])
//        }
//    }
//}


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

