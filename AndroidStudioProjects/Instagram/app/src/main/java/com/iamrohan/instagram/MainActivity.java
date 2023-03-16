package com.iamrohan.instagram;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    EditText emailInput , passwordInput;
    Button registerBtn;
    TextView errorText;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        emailInput = findViewById(R.id.editTextEmail);
        passwordInput = findViewById(R.id.editTextPassword);
        registerBtn = findViewById(R.id.registerBtn);
        errorText = findViewById(R.id.errorText);

        final String email = emailInput.getText().toString();
        final String password = passwordInput.getText().toString();

        registerBtn.setOnClickListener(v -> {
            errorText.setText(email);
            if(email.isEmpty() || email == null){
                errorText.setText("Please enter a valid email." + email);
            }else if(password.isEmpty() || password == null || password.length() < 6) {
                errorText.setText("Please enter a valid password.");
            }else {
                submit(email,password);
            }

        });

    }

    void submit(String email, String password){

    }

}