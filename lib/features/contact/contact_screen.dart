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

    final bool isDesktop = width > 1100;
    final bool isTablet = width > 600 && width <= 1100;
    final bool isMobile = width <= 600;

    final horizontalPadding = isMobile ? 20.0 : 40.0;
    final verticalPadding = isMobile ? 20.0 : 40.0;

    final headingFontSize = (width * 0.03).clamp(24.0, 32.0);
    final subHeadingFontSize = (width * 0.02).clamp(14.0, 16.0);
    final backGroundFontSize = (width * 0.1).clamp(14.0, 160.0);

    Widget content = isMobile
        ? SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
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
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
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
            text: 'Contact Me',
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
          '— Get In Touch',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: subHeadingFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: 'Hi, I’m Mohammed Salah. ',
            style: TextStyle(
              color: Colors.white,
              fontSize: headingFontSize,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: 'Let’s collaborate!',
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
          'Feel free to reach out through any of the methods below.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: subHeadingFontSize,
          ),
        ),
        const SizedBox(height: 30),
        _buildContactInfoItem(Icons.phone, '+213 656 375 516'),
        const SizedBox(height: 20),
        _buildContactInfoItem(Icons.email, 'salahinetelecom@gmail.com'),
        const SizedBox(height: 20),
        _buildContactInfoItem(Icons.web, 'github.com/salahdine2020'),
        const SizedBox(height: 20),
        _buildContactInfoItem(
            Icons.location_on, 'Tlemcen, Algeria'),
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
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 15,
    );
  }

  Widget _buildContactFormSection(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'First Name *',
                  validator: (value) =>
                  value!.isEmpty ? 'Please enter first name' : null,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildTextField(
                  label: 'Last Name *',
                  validator: (value) =>
                  value!.isEmpty ? 'Please enter last name' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
              const SizedBox(width: 20),
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
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Subject *',
            validator: (value) =>
            value!.isEmpty ? 'Please enter subject' : null,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Message *',
            maxLines: 5,
            validator: (value) =>
            value!.isEmpty ? 'Please enter message' : null,
          ),
          const SizedBox(height: 20),
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
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Message Sent Successfully!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.greenAccent,
        ),
      );
    }
  }
}
