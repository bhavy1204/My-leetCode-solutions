// Given a string s, return the string after replacing every uppercase letter with the same lowercase letter.

 

// Example 1:

// Input: s = "Hello"
// Output: "hello"
// Example 2:

// Input: s = "here"
// Output: "here"
// Example 3:

// Input: s = "LOVELY"
// Output: "lovely"
 

// Constraints:

// 1 <= s.length <= 100
// s consists of printable ASCII characters.

// MY SOLUTION 
class Solution {
    public String toLowerCase(String s) {
        StringBuilder str = new StringBuilder();
        for(int i =0 ;i<s.length();i++){
            char c = s.charAt(i);
            if(c>='A' && c<='Z')
                str.append((char)(c+32));
            else
                str.append(c);
        }
        return str.toString();
    }
}
