# Developer OS

A Fedora-inspired portfolio web application built with Flutter Web, featuring a desktop-like environment, window management, and a terminal interface.

## Live Demo
Check out the live version here: [https://waleed719.github.io/developeros/](https://waleed719.github.io/developeros/)

## Features
- **Window Management**: Drag, drop, minimize, and maximize windows.
- **Terminal**: A functional terminal with commands like `whoami`, `skills`, `projects`, and `contact`.
- **File Manager**: A visual project explorer.
- **Themes**: Switch between light and dark modes.

## Deployment
This project is automatically deployed to GitHub Pages using GitHub Actions.
Any push to the `main` branch triggers a build and deploys the `web` output to the `gh-pages` branch.

## Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/waleed719/developeros.git
    cd developeros
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run locally**:
    ```bash
    flutter run -d chrome
    ```
