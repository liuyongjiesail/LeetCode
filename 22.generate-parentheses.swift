/*
 * @lc app=leetcode id=22 lang=swift
 *
 * [22] Generate Parentheses
 */

 /*

✔ Accepted
  ✔ 8/8 cases passed (20 ms)
  ✔ Your runtime beats 92.24 % of swift submissions
  ✔ Your memory usage beats 7.14 % of swift submissions (21.3 MB)

 */
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var resultArray = Array<String>()
        self.generateParenthesisDFS(n, n, "", &resultArray)
        return resultArray
        
    }
    
    func generateParenthesisDFS(_ left: Int, _ right: Int, _ out: String, _ result: inout Array<String>) -> Void {
        if left > right {
            return
        }
        if left == 0 && right == 0 {
            result.append(out)
        } else {
            if left > 0 {
                generateParenthesisDFS(left - 1, right, out + "(", &result)
            }
            if right > 0 {
                generateParenthesisDFS(left, right - 1, out + ")", &result)
            }
        }
    }
}

