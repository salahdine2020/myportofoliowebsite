import 'package:flutter/material.dart';

import '../../core/widgets/backgroundtext.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Define breakpoints
    final bool isDesktop = width > 1100;
    final bool isTablet = width > 600 && width <= 1100;
    final bool isMobile = width <= 600;

    // Adjust paddings and spacing based on screen size
    final horizontalPadding = isMobile ? 20.0 : 40.0;
    final verticalPadding = isMobile ? 20.0 : 40.0;

    // Font scaling for headings
    final headingFontSize = (width * 0.03).clamp(24.0, 32.0);
    final subHeadingFontSize = (width * 0.02).clamp(14.0, 16.0);
    final backGroundFontSize = (width * 0.1).clamp(14.0, 160.0);

    Widget content = isMobile
        ? SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContactInfoSection(headingFontSize, subHeadingFontSize),
                const SizedBox(height: 40),
                _buildContactFormSection(context),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: isDesktop ? 150 : 20),
                Expanded(
                  flex: isDesktop ? 1 : 1,
                  child: _buildContactInfoSection(
                      headingFontSize, subHeadingFontSize),
                ),
                SizedBox(width: isDesktop ? 50 : 20),
                Expanded(
                  flex: isDesktop ? 2 : 1,
                  child: _buildContactFormSection(context),
                ),
                SizedBox(width: isDesktop ? 100 : 20),
              ],
            ),
          );

    return Scaffold(
      backgroundColor: const Color(0xFF5840ba),
      body: Stack(
        children: [
          LargeBackgroundText(
            text: 'Latest Projects',
            top: 0,
            left: 0,
            fontSize: backGroundFontSize,
            color: Colors.white.withOpacity(0.1),
          ),
          Column(
            children: [
              SizedBox(height: isDesktop ? 150 : 0),
              Expanded(child: content),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoSection(
      double headingFontSize, double subHeadingFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '— Contact Us',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: subHeadingFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: 'Let’s Connect & ',
            style: TextStyle(
              color: Colors.white,
              fontSize: headingFontSize,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: 'Collaborate',
                style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
          style: TextStyle(
            color: Colors.white70,
            fontSize: subHeadingFontSize,
          ),
        ),
        const SizedBox(height: 30),
        _buildContactInfoItem(Icons.phone, '+1 (406) 555-0120'),
        const SizedBox(height: 20),
        _buildContactInfoItem(Icons.email, 'example@gmail.com'),
        const SizedBox(height: 20),
        _buildContactInfoItem(Icons.web, 'example'),
        const SizedBox(height: 20),
        _buildContactInfoItem(
            Icons.location_on, '2464 Royal Ln. Mesa, New Jersey 45463'),
      ],
    );
  }

  Widget _buildContactInfoItem(IconData icon, String text) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.15),
        radius: 20,
        child: Icon(icon, color: Colors.white, size: 18),
      ),
      title: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 1.4,
        ),
      ),
      contentPadding: EdgeInsets.zero, // Remove padding if not needed
      horizontalTitleGap: 15, // Adjust spacing between leading and title
    );
  }

  Widget _buildContactFormSection(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final spacing = width <= 600 ? 10.0 : 20.0;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Name & Last Name
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'First Name *',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter first name' : null,
                ),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: _buildTextField(
                  label: 'Last Name *',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter last name' : null,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          // Email & Phone
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'Email *',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter email';
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    return !emailRegex.hasMatch(value)
                        ? 'Enter a valid email'
                        : null;
                  },
                ),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: _buildTextField(
                  label: 'Phone Number *',
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter phone number' : null,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          // Subject
          _buildTextField(
            label: 'Subject *',
            validator: (value) =>
                value!.isEmpty ? 'Please enter subject' : null,
          ),
          SizedBox(height: spacing),
          // Message
          _buildTextField(
            label: 'Message *',
            maxLines: 5,
            validator: (value) =>
                value!.isEmpty ? 'Please enter message' : null,
          ),
          SizedBox(height: spacing),

          // Send Button Row
          MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.send, color: Colors.black),
                  label: const Text(
                    'Send Message',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        errorStyle: TextStyle(color: Colors.greenAccent),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.greenAccent, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.greenAccent, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.greenAccent, width: 2),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Implement form submission logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Message Sent Successfully!',
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.greenAccent,
        ),
      );
    }
  }
}
