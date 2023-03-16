package com.iamrohan.noble;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.FirebaseException;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthOptions;
import com.google.firebase.auth.PhoneAuthProvider;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.concurrent.TimeUnit;

public class VerifyActivity extends AppCompatActivity {

    private EditText otpInput;
    private TextView timer;
    private TextView resendBtn;
    private ProgressBar progressBar;
    private Button verifyBtn;
    private String phoneNumber;
    private String otpId;


    FirebaseAuth mAuth;
    PhoneAuthProvider.ForceResendingToken token;
    PhoneAuthProvider.OnVerificationStateChangedCallbacks callbacks;

    @Override
    protected void onStart() {
        super.onStart();
        verifyPhoneNumber(phoneNumber);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_verify);


        mAuth = FirebaseAuth.getInstance();
        mAuth.getFirebaseAuthSettings().forceRecaptchaFlowForTesting(false);

        otpInput = findViewById(R.id.otpInput);
        timer = findViewById(R.id.timerTextView);
        resendBtn = findViewById(R.id.resendBtn);
        progressBar = findViewById(R.id.otpProgressBar);
        verifyBtn = findViewById(R.id.otpLoginBtn);

        phoneNumber = getIntent().getStringExtra("phoneNumber");

        startCountDown();

        verifyBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(otpInput.getText().toString().isEmpty()){
                    otpInput.setError("Invalid otp");
                    return;
                }

                progressBar.setVisibility(View.VISIBLE);
                verifyBtn.setVisibility(View.GONE);

                PhoneAuthCredential credential = PhoneAuthProvider.getCredential(otpId,otpInput.getText().toString());
                authenticateUser(credential);

                progressBar.setVisibility(View.GONE);
                verifyBtn.setVisibility(View.INVISIBLE);

            }
        });

        resendBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //resend otp
                startCountDown();
                resendBtn.setClickable(false);
                resendBtn.setTextColor(0x91A0E6);
            }
        });

    }


    private void verifyPhoneNumber(String phoneNumber){

        Toast.makeText(this,phoneNumber,Toast.LENGTH_LONG).show();

        callbacks = new PhoneAuthProvider.OnVerificationStateChangedCallbacks() {
            @Override
            public void onVerificationCompleted(@NonNull PhoneAuthCredential phoneAuthCredential) {
                authenticateUser(phoneAuthCredential);
            }

            @Override
            public void onVerificationFailed(@NonNull FirebaseException e) {
                Toast.makeText(VerifyActivity.this, e.getMessage(),Toast.LENGTH_LONG).show();
            }

            @Override
            public void onCodeSent(@NonNull String s, @NonNull PhoneAuthProvider.ForceResendingToken forceResendingToken) {
                super.onCodeSent(s, forceResendingToken);
                otpId = s;
                token = forceResendingToken;

            }

            @Override
            public void onCodeAutoRetrievalTimeOut(@NonNull String s) {
                super.onCodeAutoRetrievalTimeOut(s);
                resendBtn.setClickable(true);
                resendBtn.setTextColor(0x4361EE);
            }
        };

        PhoneAuthOptions options = PhoneAuthOptions.newBuilder(mAuth)
                .setActivity(this)
                .setPhoneNumber(phoneNumber)
                .setTimeout(60L , TimeUnit.SECONDS)
                .setCallbacks(callbacks)
                .build();

        PhoneAuthProvider.verifyPhoneNumber(options);


    }

    private void authenticateUser(PhoneAuthCredential credential){

        mAuth.signInWithCredential(credential).addOnSuccessListener(new OnSuccessListener<AuthResult>() {
            @Override
            public void onSuccess(AuthResult authResult) {
                FirebaseUser user = authResult.getUser();
                Toast.makeText(getApplicationContext(),"login successful", Toast.LENGTH_SHORT).show();
                startActivity(new Intent(getApplicationContext(), ProfileActivity.class));
                finish();
            }
        }).addOnFailureListener(new OnFailureListener() {
            @Override
            public void onFailure(@NonNull Exception e) {
                Toast.makeText(getApplicationContext(),e.getMessage(), Toast.LENGTH_SHORT).show();

            }
        });


    }

    private void startCountDown(){
         new CountDownTimer(60000,1000){



            @Override
            public void onTick(long millisUntilFinished) {
                NumberFormat f = new DecimalFormat("00");
                long min = (millisUntilFinished / 60000) % 60;
                long sec = (millisUntilFinished / 1000) % 60;
                timer.setText(f.format(min) + ":" + f.format(sec));
            }

            @Override
            public void onFinish() {
                timer.setText("00:00");
                resendBtn.setClickable(true);
                resendBtn.setTextColor(0x4361EE);
            }
        }.start();
    }

}