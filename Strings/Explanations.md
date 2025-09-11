## Dynamic Programming Problems

### [2785. Sort vowels in string](./2785_Sort-Vowels-in-a-String.java)
- **Idea:** Create a freq array for sorting vowels
- **Time Complexity:** O(n)
- **Explanation**
>we will create a seprate array and map each idx with the ASCII value. Like idx 67 will denote 'A' and the value at idx will denote the freq of A in the string. Than we will iterate the string s and if the vowel appear we will insert char in result from the freq array using a while loop for multple occurence and than increment the freqIdx. And if not vowel than we will just append the char at idx of S. And in end return the result string. 