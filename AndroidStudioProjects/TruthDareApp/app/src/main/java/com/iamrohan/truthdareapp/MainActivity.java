package com.iamrohan.truthdareapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.RotateAnimation;
import android.widget.Button;
import android.widget.ImageView;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    Button button;
    ImageView imageView;
    Random random = new Random();
    int lastDirection ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button = findViewById(R.id.button);
        imageView = findViewById(R.id.imageView);


        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                int randint = random.nextInt(4);

                int newDirection = (randint * 90);

                float x = imageView.getWidth()/2;
                float y = imageView.getHeight()/2;

                Animation animation = new RotateAnimation(lastDirection,((360*2) + newDirection),x,y);
                animation.setDuration(2000);
                animation.setFillAfter(true);
                imageView.startAnimation(animation);
                lastDirection = newDirection;

                animation.setAnimationListener(new Animation.AnimationListener() {
                    @Override
                    public void onAnimationStart(Animation animation) {
                        button.setEnabled(false);
                    }

                    @Override
                    public void onAnimationEnd(Animation animation) {
                        button.setEnabled(true);
                    }

                    @Override
                    public void onAnimationRepeat(Animation animation) {

                    }


                });

            }
        });
    }
}