/*
 * @lc app=leetcode id=3 lang=c
 *
 * [3] Longest Substring Without Repeating Characters
 *
 * https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
 *
 * algorithms
 * Medium (26.11%)
 * Total Accepted:    760.4K
 * Total Submissions: 2.9M
 * Testcase Example:  '"abcabcbb"'
 *
 * Given a string, find the length of the longest substring without repeating
 * characters.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: "abcabcbb"
 * Output: 3 
 * Explanation: The answer is "abc", with the length of 3. 
 * 
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: "bbbbb"
 * Output: 1
 * Explanation: The answer is "b", with the length of 1.
 * 
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: "pwwkew"
 * Output: 3
 * Explanation: The answer is "wke", with the length of 3. 
 * ⁠            Note that the answer must be a substring, "pwke" is a
 * subsequence and not a substring.
 * 
 * 
 * 
 * 
 * 
 */
/*
 int isContain(char *s, char c) {
    while(*s != '\0') {
        if(*s == c) {
            return 1;
        } else {
            s++;
        }
    }
    return 0;
}
 
int lengthOfLongestSubstring(char* s) {
    
    char result[1000];
    int longest = 0;
    for(int i = 0; i < strlen(s) - 1; i++) {
        if(isContain(result, s[i]) == 1) {
            if(strlen(result) > longest) {
                longest = strlen(result);
            }
        }
        char temp[2] = {s[i], '\0'};
        strncat(result, temp);
    }
    return longest;
}
*/

int lengthOfLongestSubstring(char* s) {
    
    int longest = 0;
    char *end = s;
    char *temp;
    char *addressTable[128] = {NULL};
    while(*end) {
        temp = addressTable[*end];
        addressTable[*end] = end;
        if(temp >= s) {
            longest = end - s > longest ? end - s : longest;
            s = temp + 1;
        }
        end++;
    }
    longest = end - s > longest ? end - s : longest;
    return longest;
}

