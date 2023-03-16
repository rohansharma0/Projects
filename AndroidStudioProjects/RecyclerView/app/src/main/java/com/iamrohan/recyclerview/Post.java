package com.iamrohan.recyclerview;

public class Post {
    private String mAuthorName;
    private int mImageUrl;
    private String mCaption;



    public  Post(String authorName,int imageUrl,String caption){
        this.mAuthorName = authorName;
        this.mImageUrl = imageUrl;
        this.mCaption = caption;
    }

    public String getAuthorName() {
        return mAuthorName;
    }

    public int getImageUrl() {
        return mImageUrl;
    }

    public String getCaption() {
        return mCaption;
    }
}
