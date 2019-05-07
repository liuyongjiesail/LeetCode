/*
 * @lc app=leetcode id=19 lang=swift
 *
 * [19] Remove Nth Node From End of List
 *
 * https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
 *
 * algorithms
 * Medium (34.10%)
 * Total Accepted:    383.7K
 * Total Submissions: 1.1M
 * Testcase Example:  '[1,2,3,4,5]\n2'
 *
 * Given a linked list, remove the n-th node from the end of list and return
 * its head.
 * 
 * Example:
 * 
 * 
 * Given linked list: 1->2->3->4->5, and n = 2.
 * 
 * After removing the second node from the end, the linked list becomes
 * 1->2->3->5.
 * 
 * 
 * Note:
 * 
 * Given n will always be valid.
 * 
 * Follow up:
 * 
 * Could you do this in one pass?
 * 
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

 思路：利用快慢指针方式

 ✔ Accepted
  ✔ 208/208 cases passed (12 ms)
  ✔ Your runtime beats 79.19 % of swift submissions
  ✔ Your memory usage beats 51.35 % of swift submissions (18.7 MB)

 */

 class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var fast:ListNode? = dummy
        var slow:ListNode? = dummy
        
        for _ in 0..<(n+1) {
            fast = fast?.next
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
        return dummy.next
    }
    
}

 /*

✔ Accepted
  ✔ 208/208 cases passed (20 ms)
  ✔ Your runtime beats 8.6 % of swift submissions
  ✔ Your memory usage beats 24.32 % of swift submissions (18.8 MB)

  思路：
  1. 算出链表的长度
  2. 长度减去n就是倒数第几个
  3. 让倒数这个链表值指向下一个的下一个就可以了

 */
/*
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var length = 0
        var first = head
        
        while (first != nil) {
            length = length + 1
            first = first?.next
        }
        
        length = length - n
        first = dummy
        while length > 0 {
            length = length - 1
            first = first?.next
        }
        
        first?.next = first?.next?.next
        
        return dummy.next
    }
    
}
*/
