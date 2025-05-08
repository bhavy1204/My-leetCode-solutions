// Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 

// Example 1:

// Input: haystack = "sadbutsad", needle = "sad"
// Output: 0
// Explanation: "sad" occurs at index 0 and 6.
// The first occurrence is at index 0, so we return 0.
// Example 2:

// Input: haystack = "leetcode", needle = "leeto"
// Output: -1
// Explanation: "leeto" did not occur in "leetcode", so we return -1.
 

// Constraints:

// 1 <= haystack.length, needle.length <= 104
// haystack and needle consist of only lowercase English characters.

// MY SOLUTION 

class Solution {
    public int strStr(String haystack, String needle) {
        if(haystack.length()==0 || needle.length() ==0)
        return 0;
        int Nlen = needle.length(), Hlen = haystack.length();
        for(int i =0 ;i<=Hlen-Nlen;i++){
            boolean match=true;
            for(int j =0 ;j<Nlen;j++){
                if(haystack.charAt(i+j ) != needle.charAt(j)){
                    match = false;
                    break;
                }
            }
            if(match) 
                return i;
        }
        return -1;
    }
}
