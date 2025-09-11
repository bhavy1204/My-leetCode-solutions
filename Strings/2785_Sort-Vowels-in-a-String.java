class Solution {
    public String sortVowels(String s) {
        String vowles = "AEIOUaeiou";
        int freq[] = new int[118];

        for(char c : s.toCharArray()){
            if(vowles.indexOf(c) != -1)
                freq[c]++;
        }

        StringBuilder sort = new StringBuilder();

        for(int i=0;i<118;i++){
            while(freq[i]>0){
                sort.append((char)i);
                freq[i]--;
            }
        }

        StringBuilder res = new StringBuilder();

        int idx=0;
        for(char c:s.toCharArray()){
            if(vowles.indexOf(c) !=-1){
                res.append(sort.charAt(idx++));
            }else{
                res.append(c);
            }
        }
        
        return res.toString();
    }
}
