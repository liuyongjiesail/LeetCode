/*
 * @lc app=leetcode id=24 lang=swift
 *
 * [24] Swap Nodes in Pairs
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

利用了回溯的思想，递归遍历到链表末尾，然后先交换末尾两个，然后依次往前交换

✔ Accepted
  ✔ 55/55 cases passed (8 ms)
  ✔ Your runtime beats 90.03 % of swift submissions
  ✔ Your memory usage beats 5.14 % of swift submissions (20.6 MB)

 */

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return head
        }
        
        var t:ListNode = (head?.next)!
        head?.next = swapPairs(head?.next?.next)
        t.next = head
        
        return t
    }
}

