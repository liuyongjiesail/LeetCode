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

108 ms  复杂度 > O(m+n)

✔ Accepted
  ✔ 2084/2084 cases passed (112 ms)
  ✔ Your runtime beats 54.42 % of swift submissions
  ✔ Your memory usage beats 5.63 % of swift submissions (19.8 MB)

思路：  合并数组 -> 排序 -> 找中位数

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


/*

92ms  复杂度 O(m+n)

✔ Accepted
  ✔ 2084/2084 cases passed (88 ms)
  ✔ Your runtime beats 98.29 % of swift submissions
  ✔ Your memory usage beats 19.72 % of swift submissions (19.6 MB)

思路：  合并两个数组 -> 找中位数

1. 因为两个数组都是有序的数组，所以可以从头开始比较；
如果num1 < num2 就把num1加到新数组里；
然后移到第二位，再和nums2的第一个元素比较，如果还是大，再移动位置；
依次类推，直到其中一个的位置就是最后一个了
2. 如果哪个数组后面还有位数，就拼接在新数组后面，这时这个新数组就是已经排好序的数组
3. 元素数量是偶数，取count/2 + count/2 - 1的元素除以2.0；元素数是奇数，取count/2元素

*/
// class Solution {
//     func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
//         var i1 = nums1.startIndex
//         var i2 = nums2.startIndex
//         var resultArray = Array<Int>()
        
//         while i1 < nums1.endIndex && i2 < nums2.endIndex {
            
//             let num1 = nums1[i1];
//             let num2 = nums2[i2];
            
//             if num1 < num2 {
//                 resultArray.append(num1)
//                 i1 = nums1.index(i1, offsetBy: 1)
//             } else {
//                 resultArray.append(num2)
//                 i2 = nums2.index(i2, offsetBy: 1)
//             }
//         }
        
//         if i1 < nums1.endIndex {
//             resultArray += nums1[i1..<nums1.endIndex]
//         }
//         if i2 < nums2.endIndex {
//             resultArray += nums2[i2..<nums2.endIndex]
//         }

//         // 排序完成的数组
//         let count:Int = resultArray.count

//           if count % 2 == 0 {
//             let num1:Int = resultArray[count/2]
//             let num2:Int = resultArray[count/2 - 1]
//             return Double((num1 + num2))/2.0
//         } else {
//             return Double(resultArray[count/2])
//         }
//     }
// }
