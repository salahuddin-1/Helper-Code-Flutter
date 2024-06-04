# Tips and some basic information about Mobile Development and Flutter

### # Tip 1

Never include "\_" in your bundle ID and package name, it is a bad practise

In Flutter, as well as in general mobile app development, it's not considered a good practice to use underscores in the bundle identifier (iOS) or package name (Android) of your project. Both iOS and Android have specific conventions for these identifiers:

iOS Bundle Identifier: According to Apple's guidelines, the bundle identifier should use reverse-DNS notation (e.g., com.example.myapp) and should only include alphanumeric characters (A-Z, a-z, 0-9), hyphens (-), and periods (.). Underscores are not recommended and may cause issues.

Android Package Name: The Android package name also uses reverse-DNS notation and should follow Java package naming conventions. It should only include lowercase letters, numbers, and periods. Again, underscores are not allowed.

Here's an example of a valid bundle identifier and package name:

iOS: com.example.myapp
Android: com.example.myapp
