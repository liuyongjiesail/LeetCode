/*
 * @lc app=leetcode id=27 lang=swift
 *
 * [27] Remove Element
 */

 /*
 思路：遍历一次即可解决
 定义一个变量index, 其为最后一个元素
 遍历时，如果当前index 等于目标值，就要与最后一个非目标值的元素交换位置，交换后 right--
 知道index >= right 就停止，最后right前面的就是结果数组，元素个数就是right+1

✔ Accepted
  ✔ 113/113 cases passed (12 ms)
  ✔ Your runtime beats 37.71 % of swift submissions
  ✔ Your memory usage beats 5.11 % of swift submissions (21.4 MB)

 */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        var right:Int = nums.count - 1
        
        for (index, number) in nums.enumerated() {
            if index >= right {
                if number == val {
                    right -= 1
                }
                break
            }
            if number == val {
                if nums[right] != val {
                    nums.swapAt(index, right)
                    right -= 1
                } else {
                    while nums[right] == val {
                        right -= 1
                        if right < 0 {
                            break
                        }
                    }
                    if index >= right {
                        break
                    }
                    nums.swapAt(index, right)
                    right -= 1
                }
            }
        }
        return right + 1
    }
}

