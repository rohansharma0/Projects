package com.example.whatsapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;

public class OtpActivity extends AppCompatActivity {

    private FirebaseAuth mAuth;
    private FirebaseUser mCurrentUser;

    private  String mAuthCredentials;

    private EditText otpNumber;
    private Button verifyBtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_otp);

        mAuth = FirebaseAuth.getInstance();
        mCurrentUser = mAuth.getCurrentUser();

        mAuthCredentials = getIntent().getStringExtra("AuthCredentials");

        otpNumber = (EditText)findViewById(R.id.otpNumber);
        verifyBtn =(Button)findViewById(R.id.verifyBtn);

        verifyBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String otp = otpNumber.getText().toString();
                if(otp.isEmpty()){

                }else {
                    PhoneAuthCredential credential = PhoneAuthProvider.getCredential(mAuthCredentials,otp);
                    signInWithPhoneCredential(credential);
                }
            }
        });
    }

    private void signInWithPhoneCredential(PhoneAuthCredential credential){
        mAuth.signInWithCredential(credential).addOnCompleteListener(
                OtpActivity.this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if(task.isSuccessful()){
                            Intent setDetails = new Intent(OtpActivity.this, DetailsActivity.class);
                            startActivity(setDetails);
                        }else {
                            if(task.getException() instanceof FirebaseAuthInvalidCredentialsException){

                            }
                        }
                    }
                }
        );
    }


    @Override
    protected void onStart() {
        super.onStart();
        if(mCurrentUser != null){
            setUserToHome();
        }
    }
    public void setUserToHome(){
        Intent home = new Intent( OtpActivity.this, MainActivity.class);
        home.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        home.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
        startActivity(home);
        finish();
    }
}
