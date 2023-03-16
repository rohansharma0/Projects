public class Trie {
    
    private static TrieNode root;

    public Trie(){
        root = new TrieNode();
    }

    public static void insert(String word){

        TrieNode node = root;

        for(char c : word.toCharArray()){

            if(!node.containsKey(c)){
                node.put(c , new TrieNode());
            }

            node = node.get(c);
            node.increasePrefix();
        }

        node.setEnd();
        node.increaseEnd();
    }

    public static boolean search(String word){

        TrieNode node = root;

        for(char c : word.toCharArray()){
            if(!node.containsKey(c)) return false;

            node = node.get(c);
        }

        return node.isEnd();

    }

    public static boolean startsWith(String word){
        TrieNode node = root;

        for(char c : word.toCharArray()){
            if(!node.containsKey(c)) return false;

            node = node.get(c);
        }

        return true;
    }

    public int countWordsEqualTo(String word){
        TrieNode node = root;

        for(char c : word.toCharArray()){
            if(node.containsKey(c)){
                node = node.get(c);
            }else{
                return 0;
            }
        }

        return node.getEndCount();
    }

    public int countWordsStartingWith(String word){
        TrieNode node = root;

        for(char c : word.toCharArray()){
            if(node.containsKey(c)){
                node = node.get(c);
            }else{
                return 0;
            }
        }

        return node.getPrefixCount();
    } 

    public void erase(String word){
        TrieNode node = root;

        for(char c : word.toCharArray()){
            if(node.containsKey(c)){
                node = node.get(c);
                node.reducePrefix();
            }else{
                return;
            }
        }

        node.deleteEnd();

    }

}

class TrieNode{
    TrieNode[] links = new TrieNode[26];
    boolean flag = false;

    //end with
    int cntEndWith= 0;
    
    //count prifix
    int cntPrefix = 0 ;

    TrieNode(){
    }

    void increaseEnd(){
        cntEndWith++;
    }

    void increasePrefix(){
        cntPrefix++;
    }

    void deleteEnd(){
        cntEndWith--;
    }

    void reducePrefix(){
        cntPrefix--;
    } 

    int getEndCount(){
        return cntEndWith;
    }

    int getPrefixCount(){
        return cntPrefix;
    }
    public void setEnd(){
        this.flag = true;
    }

    public boolean isEnd(){
        return this.flag == true;
    }

    public boolean containsKey(char c){
        return this.links[c - 'a'] != null;
    }

    public void put(char c , TrieNode node) {
        this.links[c - 'a'] = node;
    }

    public TrieNode get(char c){
        return this.links[c - 'a'];
    }

}
