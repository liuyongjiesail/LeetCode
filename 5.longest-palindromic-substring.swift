/*
 * @lc app=leetcode id=5 lang=swift
 *
 * [5] Longest Palindromic Substring
 *
 * https://leetcode.com/problems/longest-palindromic-substring/description/
 *
 * algorithms
 * Medium (26.37%)
 * Total Accepted:    494.3K
 * Total Submissions: 1.8M
 * Testcase Example:  '"babad"'
 *
 * Given a string s, find the longest palindromic substring in s. You may
 * assume that the maximum length of s is 1000.
 * 
 * Example 1:
 * 
 * 
 * Input: "babad"
 * Output: "bab"
 * Note: "aba" is also a valid answer.
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: "cbbd"
 * Output: "bb"
 * 
 * 
 */

 /*

优化的从中心扩展

   把字符串都弄成奇数回文，减少了循环次数

✔ Accepted
  ✔ 103/103 cases passed (2576 ms)
  ✔ Your runtime beats 15.3 % of swift submissions
  ✔ Your memory usage beats 15 % of swift submissions (20 MB)

 */

class Solution {
    
    func longestPalindrome(_ s: String) -> String {
        
        var longestPalindrome = String()
        let charArray = Array(s)
        var newCharArray = Array<Character>()
        
        for i in 0..<charArray.count {
            newCharArray.append("#")
            newCharArray.append(charArray[i])
        }
        newCharArray.append("#")
        
        if newCharArray.count == 0 {
            return ""
        }
        if newCharArray.count == 1 {
            return s
        }
        
        longestPalindrome = String(newCharArray[0])
        
        for i in 0..<newCharArray.count {
            
            let tempString:String = centerExtend(newCharArray, i, i)
            
            if tempString.count > longestPalindrome.count {
                longestPalindrome = tempString;
            }
            
        }
        
        var result = String()
        for char in longestPalindrome {
            if char != "#" {
                result += String(char)
            }
        }
        
        return result
    }
    
    func centerExtend(_ charArray: Array<Character>, _ left: Int, _ right: Int) -> String {
        
        var currentLeft:Int = left
        var currentRight:Int = right
        
        while currentLeft >= 0 && currentRight <= charArray.count - 1 && charArray[currentLeft] == charArray[currentRight] {
            currentLeft -= 1
            currentRight += 1
        }
        
        return String(charArray[currentLeft+1..<currentRight])
    }
    
}


 /*
 
 中心扩展方法

 ✘ Time Limit Exceeded
  ✘ 91/103 cases passed (N/A)
  ✘ testcase: '"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"'
  ✘ answer: 
  ✘ expected_answer: 
  ✘ stdout:

 */
/*
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
*/
 /*

动态规划

✘ Time Limit Exceeded
  ✘ 89/103 cases passed (N/A)
  ✘ testcase: '"abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa"'
  ✘ answer: 
  ✘ expected_answer: 
  ✘ stdout:

 */
/*
class Solution {
    
    func longestPalindrome(_ s: String) -> String {
        
        var maxPalinLength = 0
        var longestPalindrome = String()
        let charArray = Array(s)

        if charArray.count < 1 {
            return ""
        }
                
        if charArray.count == 1 {
            return s
        }
        
        longestPalindrome = String(charArray[0])

        if charArray.count == 2 {
            if charArray[0] == charArray[1] {
                return s
            } else {
                return String(charArray[0])
            }
        }
        
        var tempArray = Array<Int>()
        var doubleArray = Array<Array<Int>>()

        for index in 0..<charArray.count {
            tempArray.append(1)
        }
        
        for index in 0..<charArray.count {
            doubleArray.append(tempArray)
        }
                
        for i in 0...charArray.count - 2 {
            if charArray[i] == charArray[i+1] {
                doubleArray[i][i+1] = 1
                longestPalindrome = String(charArray[i..<i+2])
            }
        }
        
        for l in 2...charArray.count {
            for i in 0...charArray.count - l {
                let j = i + l - 1
                if charArray[i] == charArray[j] {
                    doubleArray[i][j] = doubleArray[i+1][j-1]
                    if doubleArray[i][j] == 1 && l > maxPalinLength {
                        longestPalindrome = String(charArray[i..<j+1])
                    }
                } else {
                    doubleArray[i][j] = 0;
                }
            }
        }
        
        return longestPalindrome
    }
    
}
*/

/*
  暴力破解超时

 Time Limit Exceeded
  ✘ 41/103 cases passed (N/A)
  ✘ testcase: '"civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"'
  ✘ answer: 
  ✘ expected_answer: 
  ✘ stdout:

*/
/*
class Solution {
    
    func longestPalindrome(_ s: String) -> String {
        
        var maxPalinLength = 0
        let charArray = Array(s)

        if charArray.count < 1 {
            return ""
        }
        
        var longestPalindrome = String(charArray[0])
        
        if charArray.count == 1 {
            return s
        }
        if charArray.count == 2 && charArray[0] != charArray[1] {
            return String(charArray[0])
        }
        
        for i in 0..<charArray.count {
            for j in i+1..<charArray.count {
                let length = j - i
                let currentString = String(charArray[i..<j+1])
                if isPalindrome(currentString) {
                    if length > maxPalinLength {
                        longestPalindrome = currentString
                        maxPalinLength = length;
                    }
                }
            }
        }
        
        return longestPalindrome;
    }
    
    func isPalindrome(_ s: String) -> Bool {
        var charArray = Array(s)
        let count = charArray.count
        for i in 0..<count-1 {
            if charArray[i] != charArray[count - 1 - i] {
                return false
            }
        }
        return true
    }
}
*/
