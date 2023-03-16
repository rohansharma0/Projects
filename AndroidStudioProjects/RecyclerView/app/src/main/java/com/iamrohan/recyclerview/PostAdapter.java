package com.iamrohan.recyclerview;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class PostAdapter extends RecyclerView.Adapter<PostAdapter.PostViewHolder> {

    //6.2
    private ArrayList<Post> mPostList;

    //1
    public static class PostViewHolder extends RecyclerView.ViewHolder{
        public ImageView postImage;
        public TextView userName , authorName , captionText;

        //2
        public PostViewHolder(@NonNull View itemView) {
            super(itemView);

            //4
            postImage = itemView.findViewById(R.id.postImage);
            userName = itemView.findViewById(R.id.userName);
            authorName = itemView.findViewById(R.id.authorName);
            captionText = itemView.findViewById(R.id.captionText);


        }
    }
    //6.1
    public PostAdapter(ArrayList<Post> postList){
        mPostList = postList;
    }

    //3
    @NonNull
    @Override
    public PostViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
       //5
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.post_item , parent , false);
        PostViewHolder postViewHolder = new PostViewHolder(view);
        return  postViewHolder;

    }

    @Override
    public void onBindViewHolder(@NonNull PostViewHolder holder, int position) {

        Post post = mPostList.get(position);

        holder.postImage.setImageResource(post.getImageUrl());
        holder.userName.setText(post.getAuthorName());
        holder.authorName.setText(post.getAuthorName());
        holder.captionText.setText(post.getCaption());

    }

    @Override
    public int getItemCount() {
        return mPostList.size();
    }



}
