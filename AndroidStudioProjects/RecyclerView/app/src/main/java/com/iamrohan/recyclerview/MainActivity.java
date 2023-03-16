package com.iamrohan.recyclerview;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    private RecyclerView recyclerView;
    private RecyclerView.Adapter adapter;
    private RecyclerView.LayoutManager layoutManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ArrayList<Post> postList = new ArrayList<>();

        postList.add(new Post( "rohan_sharma0" , R.drawable.image ,"cation1"));
        postList.add(new Post( "rohan_sharma1" , R.drawable.image2 ,"cation2"));
        postList.add(new Post( "rohan_sharma2" , R.drawable.image3 ,"cation3"));


        recyclerView = findViewById(R.id.postScreen);

        recyclerView.setHasFixedSize(true);

        layoutManager = new LinearLayoutManager(this);
        adapter = new PostAdapter(postList);

        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setAdapter(adapter);

    }
}