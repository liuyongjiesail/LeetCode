/*
 * @lc app=leetcode id=4 lang=swift
 *
 * [4] Median of Two Sorted Arrays
 *
 * https://leetcode.com/problems/median-of-two-sorted-arrays/description/
 *
 * algorithms
 * Hard (25.34%)
 * Total Accepted:    385.4K
 * Total Submissions: 1.5M
 * Testcase Example:  '[1,3]\n[2]'
 *
 * There are two sorted arrays nums1 and nums2 of size m and n respectively.
 * 
 * Find the median of the two sorted arrays. The overall run time complexity
 * should be O(log (m+n)).
 * 
 * You may assume nums1 and nums2 cannot be both empty.
 * 
 * Example 1:
 * 
 * 
 * nums1 = [1, 3]
 * nums2 = [2]
 * 
 * The median is 2.0
 * 
 * 
 * Example 2:
 * 
 * 
 * nums1 = [1, 2]
 * nums2 = [3, 4]
 * 
 * The median is (2 + 3)/2 = 2.5
 * 
 * 
 */

 /*

108 ms

思路： 
1. 合并两个数组为一个数组
2. 对数组进行排序
3. 元素数量是偶数，取count/2 + count/2 - 1的元素除以2.0；元素数是奇数，取count/2元素

 */
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

