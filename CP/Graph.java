import java.io.*;
import java.util.*;

public class Graph {

    public static final Codechef.FastScanner sc = new Codechef.FastScanner();

    public static void main(String[] args) {

        int n = 3;
        int m = 6;

        ArrayList<ArrayList<Node>> adj = new ArrayList<>();

        for(int i =0 ; i<n ; i++){
            adj.add(new ArrayList<>());
        }
        adj.get(0).add(new Node(1, 100));
        adj.get(1).add(new Node(2, 100));
        adj.get(0).add(new Node(2, 100));

//        adj.get(0).add(new Node(1, 20));
//        adj.get(1).add(new Node(0, 60));
//        adj.get(1).add(new Node(2, 10));
//        adj.get(2).add(new Node(0, 10));
//        adj.get(1).add(new Node(3, 30));
//        adj.get(3).add(new Node(2, 30));

        int[][] ans = new int[n][n];
        for(int i = 0; i< n ; i++){
            ans[i] = dijkstra(n , adj , i);
        }

        int min = 1000000;
        int min2 = 1000000;

        for(int i = 0; i< n ; i++){
            for(int j = 0; j < n ; j++){
                if(i != j){
                    int c = ans[i][j]+ans[j][i];
                    if(c < min){
                        min2 = min;
                        min = c;
                    }else if(c < min2){
                        min2 = c;
                    }
                }

            }

        }

        System.out.println(min);
        System.out.println(min2);

    }

    public static ArrayList<ArrayList<Integer>> kosaRaju(int n , ArrayList<ArrayList<Integer>> adj){

        boolean[] vis = new boolean[n];

        Stack<Integer> st = new Stack<>();

        for(int i = 0; i< n ; i++){
            if(!vis[i]){
                topoSortDFSHelper(i , vis , adj , st);
            }
        }

        ArrayList<ArrayList<Integer>> tAdj = new ArrayList<>();

        for(int i = 0; i< n ; i++){
            tAdj.add(new ArrayList<>());
        }

        for(int i = 0 ; i< n ; i++){
            for(Integer e : adj.get(i)){
                tAdj.get(e).add(i);
            }
        }

        vis = new boolean[n];

        ArrayList<ArrayList<Integer>> ans = new ArrayList<>();

        while (st.size()> 0){
            Integer node = st.pop();
            ArrayList<Integer> temp = new ArrayList<>();
            if(!vis[node]){
                dfs(node , tAdj ,vis ,temp);
            }
            if(temp.size() > 0){
                ans.add(temp);
            }

        }

        return ans;
    }

    public static int[] bellmanFord(int n , ArrayList<Node> adj , int src){
        int[] dist = new int[n];

        Arrays.fill(dist, Integer.MAX_VALUE);

        dist[src]= 0;

        for(int i = 1 ; i<= n-1 ; i++){
            for(Node node : adj){
                if(dist[node.getU()] + node.getWt() < dist[node.getV()]){
                    dist[node.getV()] = dist[node.getU()] + node.getWt();
                }
            }
        }

        int fl = 0;
        for(Node node : adj){
            if(dist[node.getU()] + node.getWt() < dist[node.getV()]){
                fl = 1;
                System.out.println("Negative cycle");
                break;
            }
        }

        return dist;
    }

    public static ArrayList<ArrayList<Integer>> makeUndirectedG(int n , int m){
        ArrayList<ArrayList<Integer>> adj = new ArrayList<>();

        for(int i = 0; i< n ; i++){
            adj.add(new ArrayList<>());
        }

        for(int i = 0; i < m ; i++){
            int u = sc.nextInt();
            int v = sc.nextInt();

            adj.get(u).add(v);
            adj.get(v).add(u);
        }

        return adj;
    }

    public static ArrayList<ArrayList<Node>> makeDirectedG(int n , int m , boolean weighted){
        ArrayList<ArrayList<Node>> adj = new ArrayList<>();

        for(int i = 0; i< n ; i++){
            adj.add(new ArrayList<>());
        }

        for(int i = 0; i < m ; i++){
            int u = sc.nextInt();
            int v = sc.nextInt();
            int wt = 0;
            if(weighted){
                wt = sc.nextInt();
            }
            adj.get(u).add(new Node(u , v , wt));
        }

        return adj;
    }

    public static ArrayList<ArrayList<Integer>> getBridges(int n , ArrayList<ArrayList<Integer>> adj){

        ArrayList<ArrayList<Integer>> ans = new ArrayList<>();

        int[] vis = new int[n];
        int[] tin = new int[n];
        int[] low = new int[n];

        Integer timer = 0;
        for(int i = 0; i< n ; i++){
            if(vis[i] == 0){
                getBridgeHelper(i , -1 ,vis, tin , low , adj ,timer, ans);
            }
        }
        return ans;
    }

    public static void getBridgeHelper(int i , int parent , int[] vis ,int[] tin , int[] low ,ArrayList<ArrayList<Integer>> adj , Integer timer , ArrayList<ArrayList<Integer>> ans){

        vis[i] = 1;
        tin[i] = low[i] = timer++;

        for(Integer it : adj.get(i)){
            if(it == parent) continue;

            if(vis[it] == 0){
                getBridgeHelper(it , i , vis , tin , low , adj , timer , ans);
                low[it] = Math.min(low[i] , low[it]);

                if(low[it] > tin[i]){
                    ArrayList<Integer> x = new ArrayList<>();
                    x.add(it);
                    x.add(i);
                    ans.add(x);
                }
            }else{
                low[i] = Math.min(low[i] , tin[it]);
            }
        }

    }

    public static int kruskalMST(int n , ArrayList<Node> adj){
        adj.sort((a, b) -> a.getWt() - b.getWt());

        int res = 0;

        DisjointSet ds = new DisjointSet(n);

        for(Node node : adj){
            int u = node.getU();
            int v = node.getV();

            if(ds.findParent(u) != ds.findParent(v)){
                ds.union(u , v);
                 res += node.getWt();
            }
        }

        return res;
    }

    public static int primsMST(int n ,ArrayList<ArrayList<Node>> adj){

        int[] dist = new int[n];
        int[] parent = new int[n];
        boolean[] vis = new boolean[n];

        Arrays.fill(dist , Integer.MAX_VALUE);
        Arrays.fill(parent , -1);

        PriorityQueue<Node> pq = new PriorityQueue<>((a , b) -> a.getWt() - b.getWt());
        dist[0] = 0;
        pq.add(new Node(0, 0));

        while (pq.size() > 0){
            Node node = pq.poll();
            int u = node.getV();
            vis[u]  = true;

            for(Node el : adj.get(u)){
                if(!vis[el.getV()] && el.getWt() < dist[el.getV()]){
                    parent[el.getV()] = u;
                    dist[el.getV()] = el.getWt();
                    pq.add(new Node(el.getV() , dist[el.getV()]));
                }
            }
        }

        int res = 0;

        for(int e : dist){
            res += e;
        }

        return res;
    }

    public static int[] dijkstra(int n , ArrayList<ArrayList<Node>> adj , int src){

        int[] dist = new int[n];
        Arrays.fill(dist , 1000000);
        dist[src] = 0;

        PriorityQueue<Node> pq = new PriorityQueue<>((a , b) -> a.getWt() - b.getWt());
        pq.add(new Node(src , 0));

        while(pq.size() > 0){

            Node node = pq.poll();
            int u = node.getV();

            for(Node e : adj.get(u)){
                if(dist[u] + e.getWt() < dist[e.getV()]){
                    dist[e.getV()] = dist[u] + e.getWt();
                    pq.add(new Node(e.getV() , dist[e.getV()]));
                }
            }

        }
        return dist;
    }

    public static int[] topoSort(int n , ArrayList<ArrayList<Integer>> adj){
        int[] inDegree = new int[n];

        for(int i = 0 ; i< n ; i++){
            for(Integer e : adj.get(i)){
                inDegree[e]++;
            }
        }

        ArrayDeque<Integer> que = new ArrayDeque<>();
        for(int i = 0; i< n ; i++){
            if(inDegree[i] == 0){
                que.offer(i);
            }
        }
        int[] ans = new int[n];
        int i = 0;

        while (que.size() > 0){
            Integer node = que.poll();
            ans[i++] = node;

            for(Integer e : adj.get(node)){
                inDegree[e]--;

                if(inDegree[e] == 0){
                    que.add(e);
                }
            }
        }
        return ans;
    }

    public static int[] topoSortDFS(int n , ArrayList<ArrayList<Integer>> adj){

        boolean[] vis = new boolean[n];

        Stack<Integer> st = new Stack<>();

        for(int i = 0; i< n ; i++){
            if(!vis[i]){
                topoSortDFSHelper(i , vis , adj , st);
            }
        }

        int[] ans = new int[n];

        for(int i = 0; i< n ; i++){
            ans[i] = st.pop();
        }
        return ans;
    }

    public static void topoSortDFSHelper(int id , boolean[] vis , ArrayList<ArrayList<Integer>> adj , Stack<Integer> st){
        vis[id] = true;
        for(Integer e : adj.get(id)){
            if(!vis[e]){
                topoSortDFSHelper(e , vis , adj , st);
            }
        }
        st.push(id);
    }

    public static boolean isBipartiteDFS(int n , ArrayList<ArrayList<Integer>> adj){

        int[] vis = new int[n];
        Arrays.fill(vis , -1);
        // -1 -> not visited
        //  0 -> visited with color 1
        //  1 -> visited with color 2
        for(int i =0 ; i< n ; i++) {
            if(vis[i] == -1){
                vis[i] = 0;
                if(isBipartiteDFSHelper(i, vis, adj)) return false;
            }
        }
        return true;
    }

    public static boolean isBipartiteDFSHelper(int id , int[] vis ,  ArrayList<ArrayList<Integer>> adj){

        int parentColor = vis[id];
        int childColor = parentColor == 0 ? 1:0;

        for(Integer e : adj.get(id)){
            if(vis[e] == -1){
                vis[e] = childColor;
                if(isBipartiteDFSHelper(e, vis, adj)) return true;
            }else if(vis[e] == parentColor) return true;
        }

        return false;
    }

    public static boolean isBipartiteBFS(int n , ArrayList<ArrayList<Integer>> adj){

        int[] vis = new int[n];
        Arrays.fill(vis , -1);
        // -1 -> not visited
        //  0 -> visited with color 1
        //  1 -> visited with color 2
        for(int i =0 ; i< n ; i++) {
            if(vis[i] == -1){

                ArrayDeque<Integer> que = new ArrayDeque<>();
                que.offer(i);
                vis[i] = 0;

                while(que.size() > 0){
                    Integer node = que.poll();

                    int parentColor = vis[node];
                    int childColor = parentColor == 0 ? 1 : 0;

                    for(Integer e : adj.get(node)){
                        if(vis[e] == -1){
                            vis[e] = childColor;
                            que.add(e);
                        }else if(vis[e] == parentColor) return false;
                    }
                }
            }
        }
        return true;
    }

    public static boolean isCycleBfsDirected(int n , ArrayList<ArrayList<Integer>> adj){

        // by using topological sort -- Kahn's Algo
        int[] inDegree = new int[n];

        for(int i = 0 ; i< n ; i++){
            for(Integer e : adj.get(i)){
                inDegree[e]++;
            }
        }

        ArrayDeque<Integer> que = new ArrayDeque<>();
        for(int i = 0; i< n ; i++){
            if(inDegree[i] == 0){
                que.offer(i);
            }
        }
        int cnt = 0;
        while (que.size() > 0){
            Integer node = que.poll();
            cnt++;
            for(Integer e : adj.get(node)){
                inDegree[e]--;

                if(inDegree[e] == 0){
                    que.add(e);
                }
            }
        }
        if(cnt == n) return false;
        return true;
    }

    public static boolean isCycleDfsDirected(int n , ArrayList<ArrayList<Integer>> adj){

        boolean[] vis = new boolean[n];
        boolean[] dfsVis = new boolean[n];

        for(int i =0 ; i< n ; i++){
            if(!vis[i]){
                if(isCycleDfsDirectedHelper(i , adj , vis , dfsVis)) return true;
            }
        }
        return  false;
    }

    public static boolean isCycleDfsDirectedHelper(int id ,  ArrayList<ArrayList<Integer>> adj, boolean[] vis , boolean[] dfsVis){

        vis[id] = true;
        dfsVis[id] = true;
        for (Integer e : adj.get(id)){
            if(!vis[e]){
                if(isCycleDfsDirectedHelper(e , adj , vis , dfsVis)) return true;
            }else{
                if(dfsVis[e]) return true;
            }
        }
        dfsVis[id] = false;
        return false;
    }

    public static boolean isCycleUndirected(int n , ArrayList<ArrayList<Integer>> adj){

        boolean[] vis = new boolean[n];

        for(int i =0 ; i< n ; i++){
            if(!vis[i]){
                if(isCycleBfsUndirected(i , adj , vis)) return true;
//                if(isCycleDfsUndirected(i , adj , vis , -1)) return true;
            }
        }
        return  false;
    }

    public static boolean isCycleDfsUndirected(int id ,ArrayList<ArrayList<Integer>> adj ,boolean[] vis , int parent){
        vis[id] = true;

        for(Integer e : adj.get(id)){
            if(!vis[e]){
                if(isCycleDfsUndirected(e , adj , vis , id)) return true;
            }else if(e != parent) return true;
        }

        return false;
    }

    public static boolean isCycleBfsUndirected(int id ,ArrayList<ArrayList<Integer>> adj , boolean[] vis){
        ArrayDeque<Node> que = new ArrayDeque<>();
        que.offer(new Node(-1 , id , 0));
        vis[id] = true;
        while (que.size() > 0){
            Node node = que.poll();
            int parent = node.getU();
            int n = node.getV();

            for(Integer e : adj.get(n)){
                if(!vis[e]){
                    vis[e] = true;
                    que.add(new Node(n , e , 0));
                }else if(e != parent) return true;
            }

        }
        return false;
    }

    public static ArrayList<Integer> bfsTraversal(ArrayList<ArrayList<Integer>> adj , int n){
        boolean[] vis = new boolean[n];
        ArrayList<Integer> ans = new ArrayList<>();
        for(int i = 0 ; i<n ; i++){
            if(!vis[i]){
                ArrayDeque<Integer> que = new ArrayDeque<>();
                que.offer(i);
                vis[i] = true;
                while (que.size() > 0){
                    Integer node = que.poll();
                    ans.add(node);
                    for(Integer e : adj.get(node)){
                        if(!vis[e]){
                            vis[e] = true;
                            que.add(e);
                        }
                    }

                }
            }
        }
        return ans;
    }

    public static ArrayList<Integer> dfsTraversal(ArrayList<ArrayList<Integer>> adj , int n){
        boolean[] vis = new boolean[n];
        ArrayList<Integer> ans = new ArrayList<>();
        for(int i = 0 ; i<n ; i++){
            if(!vis[i]){
                dfs(i , adj ,vis, ans);
            }
        }
        return ans;
    }

    public static void dfs(int id , ArrayList<ArrayList<Integer>> adj ,boolean[] vis, ArrayList<Integer> ans){
        vis[id] = true;
        ans.add(id);
        for(Integer e : adj.get(id)){
            if(!vis[e]){
                dfs(e , adj , vis , ans);
            }
        }
    }


    static class FastScanner {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer("");
        String next() {
            while (!st.hasMoreTokens())
                try {
                    st = new StringTokenizer(br.readLine());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            return st.nextToken();
        }
        String nextLine(){
            String str="";
            try {
                str=br.readLine().trim();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return str;
        }
        int nextInt() {
            return Integer.parseInt(next());
        }
        int[] readArray(int n) {
            int[] a = new int[n];
            for (int i = 0; i < n; i++) a[i] = nextInt();
            return a;
        }
        long nextLong() {
            return Long.parseLong(next());
        }
        double nextDouble(){
            return Double.parseDouble(next());
        }

    }

    static class FastWriter {
        private final BufferedWriter bw;

        public FastWriter() {
            this.bw = new BufferedWriter(new OutputStreamWriter(System.out));
        }

        public void print(Object object) throws IOException {
            bw.append("" + object);
        }

        public void println(Object object) throws IOException {
            print(object);
            bw.append("\n");
        }

        public void close() throws IOException {
            bw.close();
        }
    }
}

class DisjointSet{

    private int[] parent;
    private int[] rank;

    DisjointSet(int n){
        parent = new int[n];
        rank = new int[n];

        for(int i = 0; i< n ; i++){
            parent[i] = i;
            rank[i] = 0;
        }

    }

    public int findParent(int node){
        if(node == parent[node]) return  node;
        return parent[node] = findParent(parent[node]);
    }

    public void union(int u , int v){
        u = findParent(u);
        v = findParent(v);

        if(rank[u] < rank[v]){
            parent[u] = v;
        }else if(rank[u] > rank[v]){
            parent[v] = u;
        }else{
            parent[v] = u;
            rank[u]++;
        }
    }


}

class Node{
    private int u;
    private int v;
    private int wt;

    Node(int _v){
        this.u = -1;
        this.v = _v;
        this.wt = 0;
    }

    Node(int _v , int _wt){
        this.u = -1;
        this.v = _v;
        this.wt = _wt;
    }

    Node(int _u , int _v , int _wt){
        this.u = _u;
        this.v = _v;
        this.wt = _wt;
    }

    public int getU() {
        return u;
    }

    public int getV() {
        return v;
    }

    public int getWt() {
        return wt;
    }

    @Override
    public String toString() {
        return "( " +
                u +
                " , " + v +
                " , " + wt +
                " )";
    }
}