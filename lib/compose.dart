import 'package:flutter/material.dart';

class ComposeEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        title: Text(
          'Compose',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            
            Text(
              'To',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Recipient email address',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Subject',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter subject',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Body',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TextFormField(
                maxLines: null,
                minLines: 5,
                decoration: InputDecoration(
                  hintText: 'Compose your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: IconButton(
                    onPressed: () {
                      // Implement functionality to attach files
                    },
                    icon: Icon(
                      Icons.attach_file,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    tooltip: 'Attach Files',
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement save as draft functionality
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email saved as draft')),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(100, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(28, 110, 198, 1),
                    ),
                  ),
                  icon: Icon(Icons.save, color: Theme.of(context).colorScheme.onPrimary),
                  label: Text(
                    "Save as Draft",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement send functionality
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email sent')),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(100, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(28, 110, 198, 1),
                    ),
                  ),
                  icon: Icon(Icons.telegram, color: Theme.of(context).colorScheme.onPrimary),
                  label: Text(
                    "Send",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
