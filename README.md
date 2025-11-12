# 🚚 Tow-Truck Mayhem

> A top-down 2D driving game where you drive a tow truck, deal with clients who give you ridiculous deadlines... but you’re bad at driving.

## 🎮 About the Game

This is a top-down 2D driving game built in Godot. The core concept is that you are a tow-truck driver with terrible driving physics, trying to complete jobs for impatient clients.

## 🛠️ Developer Guide

This guide is for developers working directly on this repository.

### 1. Project Setup

1.  **Install Godot:** Make sure you have the correct version of **[Godot Engine](https://godotengine.org/download/) (v4.5.1)** installed.
2.  **Install Git:** If you don't already have it, [download and install Git](https://git-scm.com/downloads).
3.  **Clone the Repository:** On your local machine, open a terminal and run the following command (replace the URL with your project's URL):
    ```bash
    git clone [https://github.com/Medcro/Tow-Truck_Mayhem](https://github.com/Medcro/Tow-Truck_Mayhem)
    ```
4.  **Navigate into the project folder:**
    ```bash
    cd tow-truck-mayhem
    ```

### 2. Opening in Godot

1.  Open the Godot Project Manager.
2.  Click the **Import** or **Scan** button.
3.  Navigate to the `tow-truck-mayhem` folder you just cloned and select the `project.godot` file.

### 3. How to Make and Submit Changes (Git Workflow)

We use a "Shared Repository" model. **Never push changes directly to the `main` branch.** Always use a feature branch for your work.

### <font color="gold">Step A: Sync with the Main Branch</font>

Before you start any new work, make sure your local `main` branch is up-to-date.

```bash
# Go to your main branch
git checkout main

# Download the latest changes from the server
git pull origin main
```

### \<font color="gold"\>Step B: Create a New Branch\</font\>

Create a new, descriptive branch for the feature or bug you are working on.

```bash
# Replace 'my-new-feature' with a descriptive name
git checkout -b my-new-feature
```

_(Good names: `fix-steering-bug`, `add-level-3`, `update-horn-sound`)_

### \<font color="gold"\>Step C: Make Your Changes & Commit\</font\>

1.  Now, open Godot and make all your code, scene, and asset changes.
2.  Once you've tested your changes, go back to your terminal.
3.  "Stage" your files for a commit:
    ```bash
    # To add all changed files at once
    git add .
    ```
4.  "Commit" your staged files. This saves a snapshot of your changes. Write a clear, short message.
    ```bash
    git commit -m "Feat: Add a new horn sound to the tow truck"
    ```
    _(Good commit message prefixes: `Feat:`, `Fix:`, `Refactor:`, `Docs:`)_
    _(Reference: https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)_

### \<font color="gold"\>Step D: Push Your Branch to the Repository\</font\>

Send your new branch (and all its commits) up to the central repository.

```bash
# This pushes your 'my-new-feature' branch to 'origin' (the main repo)
git push origin my-new-feature
```

### \<font color="gold"\>Step E: Open a Pull Request (PR)\</font\>

1.  Go to the repository on the GitHub website (e.g., `https://github.com/Medcro/Tow-Truck_Mayhem`).
2.  GitHub will see your newly pushed branch and show a yellow bar: "Your branch `my-new-feature` is ready...".
3.  Click the **"Compare & pull request"** button.
4.  Write a clear title and description, and assign any reviewers from your team.
5.  Click **"Create pull request"**.

After the PR is reviewed and approved, it can be merged into `main`.

```

```
