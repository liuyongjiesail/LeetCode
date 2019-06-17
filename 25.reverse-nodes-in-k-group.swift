/*
 * @lc app=leetcode id=25 lang=swift
 *
 * [25] Reverse Nodes in k-Group
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
 1. 先写出链表的倒置方法，需要加一个停止倒置的数字
 2. 第一次倒置的时候倒置了前K个得到一个新的链表，第二次倒置，从第K的点倒置，依次类推，最后的head就是结果链表

✔ Accepted
  ✔ 81/81 cases passed (36 ms)
  ✔ Your runtime beats 94.96 % of swift submissions
  ✔ Your memory usage beats 5.33 % of swift submissions (21.5 MB)
 */

class Solution {

    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var cur:ListNode? = head
        for _ in 0..<k {
            if cur == nil {
                return head
            }
            cur = cur?.next
        }
        
        let new_head = reverseListNode(head, k-1)
        print(new_head?.val)
        head?.next = reverseKGroup(cur, k)
        
        return new_head
    }
    
    func reverseListNode(_ head: ListNode?, _ stopNumber: Int?) -> ListNode? {
        
        let dummy:ListNode? = ListNode.init(-1)
        dummy!.next = head
        
        var temp:Int = stopNumber!
        
        let slow:ListNode? = dummy?.next
        var fast:ListNode? = slow?.next
        
        while temp != 0 {
            temp = temp - 1
            slow?.next = fast?.next
            fast?.next = dummy?.next
            dummy?.next = fast
            fast = slow?.next
        }
        return dummy?.next
    }
}
