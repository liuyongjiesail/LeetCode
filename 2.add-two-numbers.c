/*
 * @lc app=leetcode id=2 lang=c
 *
 * [2] Add Two Numbers
 *
 * https://leetcode.com/problems/add-two-numbers/description/
 *
 * algorithms
 * Medium (30.45%)
 * Total Accepted:    750.6K
 * Total Submissions: 2.5M
 * Testcase Example:  '[2,4,3]\n[5,6,4]'
 *
 * You are given two non-empty linked lists representing two non-negative
 * integers. The digits are stored in reverse order and each of their nodes
 * contain a single digit. Add the two numbers and return it as a linked list.
 * 
 * You may assume the two numbers do not contain any leading zero, except the
 * number 0 itself.
 * 
 * Example:
 * 
 * 
 * Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 * Output: 7 -> 0 -> 8
 * Explanation: 342 + 465 = 807.
 * 
 * 
 */
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {

    struct ListNode *temp1Node = l1;
    struct ListNode *temp2Node = l2;
    struct ListNode resultNode = {0}, *prev = &resultNode;
    struct ListNode *newNode;

    int sum = 0;

    while(temp1Node != NULL || temp2Node != NULL || sum > 0) {

        if(temp1Node != NULL) {
            sum += temp1Node->val;
            temp1Node = temp1Node->next;
        }

        if(temp2Node != NULL) {
            sum += temp2Node->val;
            temp2Node = temp2Node->next;
        }

        newNode = (struct ListNode *)malloc(sizeof(struct ListNode));
        newNode->val = sum % 10;
        newNode->next = NULL;

        prev->next = newNode;
        prev = prev->next;

        sum /= 10;
        
    }

    return resultNode.next;
}
