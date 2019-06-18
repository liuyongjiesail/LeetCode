/*
 * @lc app=leetcode id=26 lang=swift
 *
 * [26] Remove Duplicates from Sorted Array
 */
/*

思路：因为数组是有顺序的，所以可以通过两个前后指针来判断，定义一个i为0，j为1，循环，数组第j位置不等于数组第i位置时，i就+1，并且把两个位置的数字交换，最终i+1就是结果，数组的前i+1位置就是结果数组

✔ Accepted
  ✔ 161/161 cases passed (72 ms)
  ✔ Your runtime beats 75.84 % of swift submissions
  ✔ Your memory usage beats 5.1 % of swift submissions (21.1 MB)
*/
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var i:Int = 0
        for j in 1..<nums.count {
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i+1
    }
}

/*

思路：普通去重方式，拿一个字典存储元素为key, value为出现次数，次数大于1了，就把该元素移除，最终得到的数组就是去重后的数组，数量就是.count

✔ Accepted
  ✔ 161/161 cases passed (104 ms)
  ✔ Your runtime beats 7.37 % of swift submissions
  ✔ Your memory usage beats 5.1 % of swift submissions (21.8 MB)
*/
//  class Solution {
//     func removeDuplicates(_ nums: inout [Int]) -> Int {
        
//         var dic:Dictionary = [Int:Int]()
//         for (index, number) in nums.enumerated().reversed() {
//             if dic[number] == nil {
//                 dic[number] = 1;
//             } else {
//                 dic[number]! += 1;
//             }
//             if dic[number]! > 1 {
//                 nums.remove(at: index)
//             }
//         }
//         return nums.count
//     }
// }

 /*

✘ Time Limit Exceeded
  ✘ 160/161 cases passed (N/A)
  ✘ answer: 
  ✘ expected_answer: 
  ✘ stdout:

 */
// class Solution {
//     func removeDuplicates(_ nums: inout [Int]) -> Int {
        
//         var dic:Dictionary = [Int:Int]()
//         for number in nums.reversed() {
//             if dic[number] == nil {
//                 dic[number] = 1;
//             } else {
//                 dic[number]! += 1;
//             }
//             if dic[number]! > 1 {
//                 let index:Int = nums.index(of: number)!
//                 nums.remove(at: index)
                
//             }
//         }
//         return nums.count
//     }
// }

