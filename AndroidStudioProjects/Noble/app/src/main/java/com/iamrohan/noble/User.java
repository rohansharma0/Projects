package com.iamrohan.noble;

public class User {

    private String uid;
    private String phoneNumber;
    private String username;
    private String name;
    private String profileImageUrl;

    public User() {
    }

    public User(String uid, String phoneNumber, String username, String name, String profileImageUrl) {
        this.uid = uid;
        this.phoneNumber = phoneNumber;
        this.username = username;
        this.name = name;
        this.profileImageUrl = profileImageUrl;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfileImageUrl() {
        return profileImageUrl;
    }

    public void setProfileImageUrl(String profileImageUrl) {
        this.profileImageUrl = profileImageUrl;
    }
}
