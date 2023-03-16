import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildAvtar(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          width: 1.0,
          color: Color(0xffed5896),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x20ff89b7),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.pink[50],
        backgroundImage: AssetImage(imageUrl),
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello,',
                style: TextStyle(
                  color: Color(0xff95add8),
                  fontSize: 16,
                ),
              ),
              Text(
                'Alvarado!',
                style: GoogleFonts.poppins(
                  color: Color(0xff3e5471),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          _buildAvtar('assets/images/profile.jpg'),
        ],
      ),
    );
  }

  _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xffe5eff9),
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffff89b7),
                border: Border.all(
                  width: 1.0,
                  color: Color(0xffed5896),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40ff89b7),
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              height: 40,
              width: 40,
              child: Icon(Icons.search, color: Colors.white),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search friend',
                hintStyle: TextStyle(
                  color: Color(0xffa8bbdd),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildStorys() {
    return Container(
      height: 80,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffe5eff9),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Icon(
              Icons.add,
              color: Color(0xffa1b6da),
            ),
          ),
          SizedBox(width: 20),
          _buildAvtar('assets/images/profile1.jpg'),
          SizedBox(width: 20),
          _buildAvtar('assets/images/profile2.jpg'),
          SizedBox(width: 20),
          _buildAvtar('assets/images/profile3.jpg'),
          SizedBox(width: 20),
          _buildAvtar('assets/images/profile4.jpg'),
          SizedBox(width: 20),
          _buildAvtar('assets/images/profile5.jpg'),
        ],
      ),
    );
  }

  _buildPost(String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: Colors.grey[200],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile3.jpg'),
                  radius: 25,
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Shane Robertson',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('32m ago'),
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffffffff), Color(0xfff0f7ff)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildHeader(),
              SizedBox(height: 30),
              _buildSearchBar(),
              SizedBox(height: 30),
              _buildStorys(),
              SizedBox(height: 30),
              _buildPost('assets/images/img1.jpg'),
              _buildPost('assets/images/img2.jpg'),
              _buildPost('assets/images/img3.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
