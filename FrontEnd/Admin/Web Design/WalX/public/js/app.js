var config = {
   apiKey: "AIzaSyA07h1wn2uK60AwT7T0OMsVYJXBBMMCoGg",
    authDomain: "walx-rohan.firebaseapp.com",
    databaseURL: "https://walx-rohan.firebaseio.com",
    projectId: "walx-rohan",
    storageBucket: "walx-rohan.appspot.com",
    messagingSenderId: "1074802724582"
  };

  firebase.initializeApp(config);

    firebase.auth.Auth.Persistence.LOCAL; 

    $("#btn-login").click(function(){
        
        var email = $("#email").val();
        var password = $("#password").val(); 

        var result = firebase.auth().signInWithEmailAndPassword(email, password);
    
        result.catch(function(error){
            var errorCode = error.code; 
            var errorMessage = error.message; 

            console.log(errorCode);
            console.log(errorMessage);
        });

    });

    $("#btn-logout").click(function(){
        firebase.auth().signOut();
    });

    function switchView(view){
        $.get({
            url:view,
            cache: false,  
        }).then(function(data){
            $("#container").html(data);
        });
    }