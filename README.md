# Flutter Post Viewer App

This is a simple Flutter app that downloads posts from the internet and saves them on your phone. You can read the posts even when you're offline.

## Features

- **Get Posts Online**: Grabs a list of posts from the internet.
- **Save for Offline**: Saves all posts to your phone so you can see them anytime.
- **Track Read Posts**: When you read a post, it changes color so you know you've seen it.
- **See What's New**: If a post from the internet is different from the one you saved, an icon will show you it has been updated.

## Getting Started

Want to run this app on your computer? Just follow these steps.

### Prerequisites

You'll need to have Flutter installed on your computer.

### Installation

1.  **Download the code:**
   ```sh 
   git clone https://github.com/aasimahmad2048/knovator_project_aasim_ahmad.git
   ```

2.  **Go into the project folder:**
   ```sh
   cd knovator_project_aasim_ahmad
   ```

3.  **Get the necessary packages:**
   ```sh
   flutter pub get
   ```

4.  **Run the app:**
   ```sh
   flutter run
   ```

## How to Use

1.  When you open the app, it automatically downloads the latest posts.
2.  Use the bottom navigation bar to switch to the "Local Post" screen. Here you'll see all the posts saved on your phone.
3.  Posts you haven't read yet will have a yellow background.
4.  Tap on a post to read it. After you view it, the yellow background will disappear.
5.  If you go back to the home screen, the app will check for new updates. If any post has changed, you'll see a refresh icon (🔄) next to it in your local list.

