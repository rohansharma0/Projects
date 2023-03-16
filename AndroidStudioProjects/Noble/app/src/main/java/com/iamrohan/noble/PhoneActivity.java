package com.iamrohan.noble;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import com.hbb20.CountryCodePicker;


public class PhoneActivity extends AppCompatActivity {

    private EditText phoneInput;
    private CountryCodePicker ccp;
    private Button phoneBtn;
    private String phoneNumber;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_phone);

        phoneInput = findViewById(R.id.phoneInput);
        phoneBtn = findViewById(R.id.phoneLoginBtn);
        ccp = findViewById(R.id.ccp);


        phoneBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (phoneInput.getText().toString().isEmpty()) {
                    phoneInput.setError("Invalid phone number.");
                    return;
                }
                ccp.registerCarrierNumberEditText(phoneInput);
                phoneNumber = ccp.getFullNumberWithPlus();

                Intent i = new Intent(PhoneActivity.this, VerifyActivity.class);
                i.putExtra("phoneNumber", phoneNumber);
                startActivity(i);
            }
        });
    }

}