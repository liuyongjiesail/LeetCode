/*
 * @lc app=leetcode id=1 lang=swift
 *
 * [1] Two Sum
 *
 * https://leetcode.com/problems/two-sum/description/
 *
 * algorithms
 * Easy (40.26%)
 * Total Accepted:    1.4M
 * Total Submissions: 3.5M
 * Testcase Example:  '[2,7,11,15]\n9'
 *
 * Given an array of integers, return indices of the two numbers such that they
 * add up to a specific target.
 * 
 * You may assume that each input would have exactly one solution, and you may
 * not use the same element twice.
 * 
 * Example:
 * 
 * 
 * Given nums = [2, 7, 11, 15], target = 9,
 * 
 * Because nums[0] + nums[1] = 2 + 7 = 9,
 * return [0, 1].
 * 
 * 
 * 使用hash表存储遍历过的元素
 *
 * Time complexity: O(n)
 * Space complexity: O(n)
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]() //初始化结果数组
        var tempDictionary = [Int: Int]() //初始化临时字典
        // 循环目标数组
        for (index, number) in nums.enumerated() { 
            var temp = target - nums[index]  // 计算差值
            if tempDictionary[temp] != nil { // 如果字典中已存储过，说明找到了
                result.append((tempDictionary[temp])!)
                result.append(index)
                break;
            }
            // 以值为key, index 为value 存储元素
            tempDictionary[nums[index]] = index
        }
        return result
    }
}
