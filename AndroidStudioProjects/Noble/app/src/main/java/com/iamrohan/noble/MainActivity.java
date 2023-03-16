package com.iamrohan.noble;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;
import androidx.viewpager.widget.ViewPager;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import com.google.android.material.appbar.MaterialToolbar;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.tabs.TabLayout;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.iamrohan.noble.fragments.TabsAccessorAdapter;

public class MainActivity extends AppCompatActivity {


    FirebaseAuth mAuth;
    FirebaseUser mCurrentUser;
    private Boolean isLoggedIn;
    private User user;


    //tab_bar
    private ViewPager viewPager;
    private TabLayout tabLayout;
    private TabsAccessorAdapter tabsAccessorAdapter;
    private MaterialToolbar toolbar;

    private BottomNavigationView bottomNavigationView;
    private NavController navController;

    @Override
    protected void onStart() {
        super.onStart();
        if(mCurrentUser == null){
            sendUserToSignUp();
            isLoggedIn = false;
        }else {
            isLoggedIn = true;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mAuth = FirebaseAuth.getInstance();
        mCurrentUser = mAuth.getCurrentUser();



        AppBarConfiguration appBarConfiguration = new AppBarConfiguration.Builder(
                R.id.cameraFragment,R.id.chatsFragment,R.id.statusFragment,R.id.callsFragment,R.id.profileFragment).build();

        bottomNavigationView = findViewById(R.id.bottomNavView);
        navController = Navigation.findNavController(this , R.id.navHostFragment);
        NavigationUI.setupActionBarWithNavController(this , navController , appBarConfiguration);
        NavigationUI.setupWithNavController(bottomNavigationView , navController);

    }

    private void sendUserToSignUp() {
        Intent i = new Intent(MainActivity.this, LoginActivity.class);
        startActivity(i);
        finish();
    }

    //menu layout
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        getMenuInflater().inflate(R.menu.options_menu , menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        super.onOptionsItemSelected(item);

        if (item.getItemId() == R.id.menu_search){
            //
        }

        if (item.getItemId() == R.id.main_logout_option){
            mAuth.signOut();
            sendUserToSignUp();
        }
        if (item.getItemId() == R.id.main_setting_option){
            //setting
        }
        if (item.getItemId() == R.id.main_find_friends_option){
            //find
        }

        return  true;
    }
}