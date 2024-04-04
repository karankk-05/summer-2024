import 'package:flutter/material.dart';
import 'Button.dart';

import 'email_details.dart';

class Inbox extends StatelessWidget {

final List<String> attachmentList = [
  'attachment1.pdf',
  'attachment2.jpg\nattachment3.png',
  'attachment4.docx',
  'attachment5.mp4\nattachment6.mov',
  'attachment7.xls',
  'attachment8.pptx\nattachment9.zip',
  'attachment10.txt',
  'attachment11.pdf\nattachment12.docx',
  'attachment13.png',
  'attachment14.mp3\nattachment15.jpg',
];

  final sender = [
    "Amitabha Bandyopadhyay",
    "Manindra Agrawal",
    "Ashutosh Sharma",
    "Satish Kumar",
    "Abhay Karandikar",
    "Sandeep Shukla",
    "Kripasindhu Gantait",
    "Amalendu Krishna",
    "Arnab Bhattacharya",
    "Vineet Vashista"
];

  final timestamp = [
    
  "11:59 PM",
  "10:28 PM",
  "08:10 PM",
  "06:45 PM",
  "04:20 PM",
  "02:55 PM",
  "12:33 PM",
  "10:42 AM",
  "08:15 AM",
  "05:07 AM"
];

  


  
  final subject = [
    
    "Computational Physics Tutorial: Problem Set Solutions Available",
    "Advanced Algorithms: Final Exam Schedule and Course Wrap-up",
    "Nanotechnology Lab Project Submission Reminder",
    "Communication Systems: Guest Lecture Announcement",
    "Introduction to Computer Science: Assignment 3 Feedback and Q&A Session",
    "Cybersecurity Seminar Series: Topic Poll and Upcoming Sessions",
    "Machine Learning Workshop: Registration Deadline Extended!",
    "Materials Science Conference: Call for Abstracts and Registration",
    "Biotechnology Symposium: Keynote Speaker Confirmed!",
    "Digital Signal Processing: Office Hours Schedule for Next Week"


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView.builder(
        itemCount:sender.length,
        itemBuilder: (context, index) {
          return ProductCard(
            
            sender: sender[index],
            timestamp: timestamp[index],
            subject: subject[index],
            attachment: attachmentList[index],
          );
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String sender;
  final String timestamp;
  final String subject;
  final String attachment;

  ProductCard({
    required this.sender,
    required this.timestamp,
    required this.subject,
    required this.attachment,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmailDetailsPage(
              sender: widget.sender,
              timestamp: widget.timestamp,
              subject: widget.subject,
              attachments: widget.attachment,
            ),
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Card(
          margin: EdgeInsets.all(8.0),
          color: isHovered ? Colors.grey[200] : null, // Change color when hovered
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.sender,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3), // Adding some space between sender and subject
                      Text(
                        widget.subject,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Adding some space between subject and timestamp
                Column(
                  children: [
                    Text(
                      widget.timestamp,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PressableElevatedButton(
     sender: widget.sender,
              timestamp: widget.timestamp,
              subject: widget.subject,
              attachment: widget.attachment
              )
  
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

