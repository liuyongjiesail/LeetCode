/*
 * @lc app=leetcode id=21 lang=swift
 *
 * [21] Merge Two Sorted Lists
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

 /*

思路：
递归判断

 ✔ Accepted
  ✔ 208/208 cases passed (16 ms)
  ✔ Your runtime beats 98.8 % of swift submissions
  ✔ Your memory usage beats 7.14 % of swift submissions (20.5 MB)
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var result:ListNode? = nil
        
        if l1!.val < l2!.val {
            result = l1
            result?.next = mergeTwoLists(l1?.next, l2)
        } else {
            result = l2
            result?.next = mergeTwoLists(l1, l2?.next)
        }
        return result
    }
}

