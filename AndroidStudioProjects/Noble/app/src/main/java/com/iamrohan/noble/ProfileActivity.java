package com.iamrohan.noble;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.View;
import android.webkit.MimeTypeMap;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.CollectionReference;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.OnProgressListener;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;
import com.squareup.picasso.Picasso;

public class ProfileActivity extends AppCompatActivity {

    private FirebaseUser mCurrentUser;
    private FirebaseAuth mAuth;
    private FirebaseFirestore fStore;
    private FirebaseStorage fStorage;

    private ImageView profileImg;
    private ImageButton uploadProfileImgBtn;
    private EditText nameInput;
    private EditText usernameInput;
    private Button updateDetailsBtn;

    private String name;
    private String username;
    private String profileImageUrl;
    private Uri imageUri;


    private static final int GalleryPick = 1;
    private static final int CAMERA_REQUEST = 100;
    private static final int STORAGE_REQUEST = 200;
    private static final int IMAGEPICK_GALLERY_REQUEST = 300;
    private static final int IMAGE_PICKCAMERA_REQUEST = 400;

    String cameraPermission[];
    String storagePermission[];



    @Override
    protected void onStart() {
        super.onStart();
        updateOldData();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);


        mAuth = FirebaseAuth.getInstance();
        fStore = FirebaseFirestore.getInstance();
        fStorage = FirebaseStorage.getInstance();

        mCurrentUser = mAuth.getCurrentUser();

        profileImg = findViewById(R.id.profileImg);
        uploadProfileImgBtn = findViewById(R.id.uploadNewProfileImg);
        nameInput = findViewById(R.id.nameInput);
        usernameInput = findViewById(R.id.usernameInput);
        updateDetailsBtn = findViewById(R.id.userDetailsBtn);

        //allowing permissions of gallery and camera;
        cameraPermission = new String[]{Manifest.permission.CAMERA,Manifest.permission.WRITE_EXTERNAL_STORAGE};
        storagePermission = new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE};

        //update user details;
        updateDetailsBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                name = nameInput.getText().toString();
                username = usernameInput.getText().toString();

                if(name.isEmpty()) {
                    nameInput.setError("Enter your name.");
                    return;
                }
                if(username.isEmpty()){
                    usernameInput.setError("Enter username.");
                    return;
                }
                setNewUserData();
            }
        });

        //update profile image;
        uploadProfileImgBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent gallery = new Intent();
                gallery.setAction(Intent.ACTION_GET_CONTENT);
                gallery.setType("image/*");
                startActivityForResult(Intent.createChooser(gallery,"Select profile image"),2);
            }
        });

    }

//    private void showImagePicDialog(){
//        String options[] = {"Camera" , "Gallery"};
//        AlertDialog.Builder builder = new AlertDialog.Builder(this);
//        builder.setTitle("Pick Image From");
//        builder.setItems(options, new DialogInterface.OnClickListener() {
//            @Override
//            public void onClick(DialogInterface dialog, int which) {
//                if(which == 0){
//                    if(!checkCameraPermission()){
//                        requestCameraPermission();
//                    }else{
//                        pickFromGallery();
//                    }
//                }else if(which == 1){
//                    if(!checkStoragePermission()){
//                        requestStoragePermission();
//                    }else{
//                        pickFromGallery();
//                    }
//                }
//            }
//        });
//        builder.create().show();
//    }
//
//    //checking storage permissions
//    private Boolean checkStoragePermission(){
//        boolean result = ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == (PackageManager.PERMISSION_GRANTED);
//        return result;
//    };
//
//    //checking camera permissions
//    private Boolean checkCameraPermission(){
//        boolean result = ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) == (PackageManager.PERMISSION_GRANTED);
//        boolean result1 = ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == (PackageManager.PERMISSION_GRANTED);
//        return result && result1;
//    };
//
//    //requesting gallery permission;
//    private void requestStoragePermission(){
//        requestPermissions(storagePermission,STORAGE_REQUEST);
//    }
//
//    //requesting camera permission;
//    private void requestCameraPermission(){
//        requestPermissions(storagePermission,CAMERA_REQUEST);
//    }
//
//    //requesting camera and gallery
//    //permission if not given;
//
//
//    @Override
//    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
//        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
//        switch (requestCode){
//            case CAMERA_REQUEST:{
//                if (grantResults.length >0){
//                    boolean camera_accepted = grantResults[0] == PackageManager.PERMISSION_GRANTED;
//                    boolean writeStorage_accepted = grantResults[1] == PackageManager.PERMISSION_GRANTED;
//                    if(camera_accepted && writeStorage_accepted){
//                        pickFromGallery();
//                    }else{
//                        Toast.makeText(this, "Please Enable Camera and Storage Permissions", Toast.LENGTH_LONG).show();
//                    }
//                }
//            }
//            break;
//            case STORAGE_REQUEST:{
//                if (grantResults.length > 0){
//                    boolean writeStorage_accepted = grantResults[0] == PackageManager.PERMISSION_GRANTED;
//                    if (writeStorage_accepted){
//                        pickFromGallery();
//                    }else{
//                        Toast.makeText(this, "Please Enable Storage Permissions", Toast.LENGTH_LONG).show();
//                    }
//                }
//            }
//            break;
//        }
//    }
//
//    //pick image form gallery or camera;
//    private void pickFromGallery(){
//        Intent gallery = new Intent();
//        gallery.setAction(Intent.ACTION_GET_CONTENT);
//        gallery.setType("image/*");
//        startActivityForResult(Intent.createChooser(gallery,"Select profile image"),2);
//    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode == RESULT_OK) {

            if (requestCode == 2) {
                // Get the url of the image from data
                imageUri = data.getData();
                if (null != imageUri) {
                    // update the preview image in the layout
                    profileImg.setImageURI(imageUri);
                }
                Toast.makeText(ProfileActivity.this, "image selected", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(ProfileActivity.this, "image is not selected", Toast.LENGTH_SHORT).show();
            }
        }
    }
    private void uploadProfileImage(Uri uri){
        //Create custom uid for images
        StorageReference imageRef = fStorage.getReference("profileImages/" + System.currentTimeMillis() + "." + getFileExtension(uri));
        imageRef.putFile(uri).addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() {
            @Override
            public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) {
                imageRef.getDownloadUrl().addOnSuccessListener(new OnSuccessListener<Uri>() {
                    @Override
                    public void onSuccess(Uri uri) {
                           profileImageUrl = uri.toString();
                    }
                });
            }
        }).addOnProgressListener(new OnProgressListener<UploadTask.TaskSnapshot>() {
            @Override
            public void onProgress(@NonNull UploadTask.TaskSnapshot snapshot) {

            }
        }).addOnFailureListener(new OnFailureListener() {
            @Override
            public void onFailure(@NonNull Exception e) {
                Toast.makeText(ProfileActivity.this,e.getMessage(),Toast.LENGTH_SHORT).show();
            }
        });
    }

    private String getFileExtension(Uri uri){
        ContentResolver cr = getContentResolver();
        MimeTypeMap mime = MimeTypeMap.getSingleton();
        return  mime.getExtensionFromMimeType(cr.getType(uri));

    }

    private void setNewUserData(){

        if(imageUri != null){
            uploadProfileImage(imageUri);
        }

        DocumentReference df = fStore.collection("users").document(mCurrentUser.getUid());

        User newUser = new User(
                mCurrentUser.getUid(),
                mCurrentUser.getPhoneNumber(),
                username,
                name,
                profileImageUrl == null?"": profileImageUrl
        );

        df.set(newUser)
                .addOnSuccessListener(new OnSuccessListener<Void>() {
                    @Override
                    public void onSuccess(Void aVoid) {
                        Toast.makeText(ProfileActivity.this,"Profile updated successfully.",Toast.LENGTH_SHORT).show();
                        Intent i = new Intent(ProfileActivity.this, MainActivity.class);
                        i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                        startActivity(i);

                    }
                }).addOnFailureListener(new OnFailureListener() {
            @Override
            public void onFailure(@NonNull Exception e) {
                Toast.makeText(ProfileActivity.this,e.getMessage(),Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void updateOldData(){

        DocumentReference docRef = fStore.collection("users").document(mCurrentUser.getUid());
        docRef.get().addOnCompleteListener(new OnCompleteListener<DocumentSnapshot>() {
            @Override
            public void onComplete(@NonNull Task<DocumentSnapshot> task) {
                if (task.isSuccessful()) {
                    DocumentSnapshot document = task.getResult();
                    if (document.exists()) {
                        nameInput.setText((CharSequence) document.get("name"));
                        usernameInput.setText((CharSequence) document.get("username"));
                    } else {
                        Toast.makeText(ProfileActivity.this,"No such document",Toast.LENGTH_SHORT).show();
                    }
                } else {
                    Toast.makeText(ProfileActivity.this,"get failed with",Toast.LENGTH_SHORT).show();
                }
            }
        });


    }
}