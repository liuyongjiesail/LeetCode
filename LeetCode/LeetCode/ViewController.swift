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
        
        print(Solution().myAtoi("1095502006p8"))
        // Do any additional setup after loading the view, typically from a nib.
    }

}

// MARK: String to Integer (atoi)

class Solution {
    func myAtoi(_ str: String) -> Int {
        
        var digitArray = Array<Character>()
        var charArray = Array(str)
        var resultArray = Array<Character>()
        var isNegative = false
        
        // 空串处理
        if str.count == 0 {
            return 0
        }
        
        for i in 0..<10 {
            digitArray.append("\(i)".characters.first!)
        }
        
        for i in 0..<charArray.count {
            
            let tempChar = charArray[i]
            
            if tempChar == " " {
                if resultArray.count != 0 {
                    break
                }
                continue
            }
            
            if tempChar == "-" || tempChar == "+" {
                if resultArray.count != 0 {
                    break;
                }
                if i + 1 < charArray.count && !digitArray.contains(charArray[i+1]) {
                    return 0
                }
                if resultArray.count == 0 && i + 1 < charArray.count && digitArray.contains(charArray[i+1]){
                    if tempChar == "-" {
                        isNegative = true
                    } else {
                        isNegative = false
                    }
                }
                continue
            } else {
                if resultArray.count == 0 && !digitArray.contains(tempChar) {
                    return 0
                }
            }
            
            if resultArray.count != 0 && tempChar != "-" && !digitArray.contains(tempChar)  {
                break;
            }
            
            if digitArray.contains(tempChar) {
                if resultArray.count != 0 && Int(String(resultArray.first!)) == 0 {
                    resultArray.remove(at: 0)
                }
                resultArray.append(tempChar)
            }
            
        }
        
        if resultArray.count == 0 {
            return 0
        }
        
        print(resultArray)
        var result = 0
        
        let numberStr = "2147483647"
        let negativeStr = "2147483648"
        
        if resultArray.count > 10  {
            return isNegative ? -2147483648 : 2147483647
        } else if resultArray.count == 10 {
            
            var tempStr = String()
            if isNegative {
                tempStr = negativeStr
            } else {
                tempStr = numberStr
            }
            
            print(tempStr)
            
            print(String(resultArray[0..<resultArray.count]))
            
            if tempStr < String(resultArray[0..<resultArray.count]) {
                return isNegative ? -2147483648 : 2147483647
            } else {
                result = Int((isNegative ? "-" : "") + String(resultArray[0..<resultArray.count]))!
            }
            
        } else {
            result = Int((isNegative ? "-" : "") + String(resultArray[0..<resultArray.count]))!
        }
        
        return result
        
    }
}

// MARK: Reverse Integer

//class Solution {
//    func reverse(_ x: Int) -> Int {
//
//        let numStr = "\(x)"
//        var intArray = Array(numStr)
//        var resultArray = Array<Character>()
//
//        for i in intArray.reversed() {
//            if i != "-" {
//                if i != "0" || resultArray.count > 0 {
//                    resultArray.append(i)
//                }
//            }
//        }
//
//        if intArray[0] == "-" {
//            resultArray.insert("-", at: 0)
//        }
//        print(resultArray)
//
//        if resultArray.count == 0 {
//            return 0
//        }
//
//        let result = Int(String(resultArray[0..<resultArray.count]))!
//
//        // 溢出处理
//        if result > 2147483647 || result < -2147483648 {
//            return 0
//        }
//
//        return result
//
//    }
//}

// MARK: Zig Zag Conversion

//class Solution {
//    func convert(_ s: String, _ numRows: Int) -> String {
//
//        var charArray = Array(s)
//        var dictionary = Dictionary<Int, Array<Character>>()
//        var resultCharArray = Array<Character>()
//
//        for i in 0..<numRows {
//            let array = Array<Character>()
//            dictionary[i] = array
//        }
//
//        var temp = 0
//        var tempBool = false
//
//        for i in 0..<charArray.count {
//
//            dictionary[temp]?.append(charArray[i])
//
//            if temp >= numRows - 1 {
//                tempBool = true
//            }
//
//            if tempBool {
//                temp = temp - 1
//            } else {
//                temp = temp + 1
//            }
//
//            if temp <= 0 {
//                temp = 0
//                tempBool = false
//            }
//
//        }
//
//        print(dictionary)
//
//        for i in 0..<numRows {
//            resultCharArray = resultCharArray + dictionary[i]!
//        }
//
//        print(resultCharArray)
//
//        return String(resultCharArray[0..<resultCharArray.count])
//
//    }
//}

// MARK: Longest Palindromic Substring

//class Solution {
//
//    func longestPalindrome(_ s: String) -> String {
//
//        let charArray = Array(s)
//        var newCharArray = Array<Character>()
//
//        newCharArray.append("@")
//        newCharArray.append("#")
//        for i in 0..<charArray.count {
//            newCharArray.append(charArray[i])
//            newCharArray.append("#")
//        }
//        newCharArray.append("$")
//
//        var P = Array<Int>()
//        for _ in 0..<newCharArray.count {
//            P.append(0)
//        }
//
//        print(newCharArray)
//
//        var mi = 0, right = 0
//        var maxLen = 0, maxPoint = 0
//
//        for i in 1..<newCharArray.count-1 {
//
//            P[i] = right > i ? min(P[2*mi-i], right - i) : 1
//
//            while newCharArray[i + P[i]] == newCharArray[i - P[i]] {
//                P[i] = P[i] + 1
//            }
//
//            if right < i + P[i] {
//                right = i + P[i]
//                mi = i
//            }
//
//            if maxLen < P[i] {
//                maxLen = P[i]
//                maxPoint = i
//            }
//        }
//
//        return String(charArray[(maxPoint - maxLen)/2..<(maxPoint - maxLen)/2 + maxLen - 1])
//    }
//}

//class Solution {
//
//    func longestPalindrome(_ s: String) -> String {
//
//        var longestPalindrome = String()
//        let charArray = Array(s)
//        var newCharArray = Array<Character>()
//
//        for i in 0..<charArray.count {
//            newCharArray.append("#")
//            newCharArray.append(charArray[i])
//        }
//        newCharArray.append("#")
//
//        print(newCharArray)
//
//        if newCharArray.count == 0 {
//            return ""
//        }
//        if newCharArray.count == 1 {
//            return s
//        }
//
//        longestPalindrome = String(newCharArray[0])
//
//        for i in 0..<newCharArray.count {
//
//            let tempString:String = centerExtend(newCharArray, i, i)
//
//            if tempString.count > longestPalindrome.count {
//                longestPalindrome = tempString;
//            }
//
//        }
//
//        var result = String()
//        for char in longestPalindrome {
//            if char != "#" {
//                result += String(char)
//            }
//        }
//
//        return result
//    }
//
//    func centerExtend(_ charArray: Array<Character>, _ left: Int, _ right: Int) -> String {
//
//        var currentLeft:Int = left
//        var currentRight:Int = right
//
//        while currentLeft >= 0 && currentRight <= charArray.count - 1 && charArray[currentLeft] == charArray[currentRight] {
//            currentLeft -= 1
//            currentRight += 1
//        }
//
//        return String(charArray[currentLeft+1..<currentRight])
//    }
//
//}

//class Solution {
//
//    func longestPalindrome(_ s: String) -> String {
//
//        let charArray = Array(s)
//        var longestPalindrome = String()
//
//        if charArray.count == 0 {
//            return ""
//        }
//        if charArray.count == 1 {
//            return s
//        }
//
//        longestPalindrome = String(charArray[0])
//
//        for i in 0..<charArray.count {
//
//            var tempString:String = centerExtend(s, i, i)
//
//            if tempString.count > longestPalindrome.count {
//                longestPalindrome = tempString;
//            }
//
//            tempString = centerExtend(s, i, i+1)
//
//            if tempString.count > longestPalindrome.count {
//                longestPalindrome = tempString;
//            }
//
//        }
//
//        return longestPalindrome
//    }
//
//    func centerExtend(_ s: String, _ left: Int, _ right: Int) -> String {
//
//        let charArray = Array(s)
//        var currentLeft:Int = left
//        var currentRight:Int = right
//
//        while currentLeft >= 0 && currentRight <= s.count - 1 && charArray[currentLeft] == charArray[currentRight] {
//            currentLeft -= 1
//            currentRight += 1
//        }
//
//        return String(charArray[currentLeft+1..<currentRight])
//    }
//
//}

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

