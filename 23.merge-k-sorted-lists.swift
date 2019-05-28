/*
 * @lc app=leetcode id=23 lang=swift
 *
 * [23] Merge k Sorted Lists
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

思路：分治法，两两合并即可

✔ Accepted
  ✔ 131/131 cases passed (92 ms)
  ✔ Your runtime beats 73.8 % of swift submissions
  ✔ Your memory usage beats 5.19 % of swift submissions (26.2 MB)
*/
 
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        if lists.count == 0 {
            return nil
        }
        
        var lists = lists
        var n = lists.count
        
        while n > 1 {
            let k = (n + 1)/2
            for i in 0..<n/2 {
                lists[i] = self.mergeTwoLists(lists[i], lists[i+k])
            }
            n = k
        }
        return lists[0]
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var result:ListNode? = nil;
        
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

