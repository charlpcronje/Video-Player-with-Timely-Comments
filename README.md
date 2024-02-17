# Video Player with Timely Comments

## Overview

This project features an interactive video player that allows users to add comments at specific timestamps. The project stands out by enabling comments to be exported to a JSON file, which can then be uploaded to the server and synchronized with the video playback, providing a dynamic and interactive viewing experience.

### Key Features:

- **Video Playback**: Custom playback controls with additional functionality.
- **Timely Comments**: Add, display, and synchronize comments at specific video timestamps.
- **Comments Export/Import**: Export comments to JSON and import them for session persistence.
- **Responsive Design**: A UI that is both appealing and functional across devices.

## Installation

To set up this project locally:

1. Create a project directory and enter it:
   ```bash
   mkdir videoPlayer
   cd videoPlayer
   ```

2. Clone the repository into the current directory:
   ```bash
   git clone https://github.com/charlpcronje/Video-Player-with-Timely-Comments.git .
   ```

3. To incorporate comments synchronization, ensure a `comments.json` file is placed at the root alongside `index.html`. This JSON file should contain the exported comments array.

## Configuration

The video player reads the video file name from a `config.json` file. Ensure you create or update this file with the correct video file path:

```json
{
    "videoFileName": "path_to_your_video_file.mp4"
}
```

## Usage

- **Adding Comments**: Use the designated UI to add comments at desired timestamps.
- **Exporting Comments**: Use the provided button to export comments. Save the `comments.json` file when prompted.
- **Importing Comments**: Upload the `comments.json` file to the server where `index.html` is located to synchronize comments across sessions.

### Note on Comments Import

The system attempts to load comments from `comments.json` at initialization. If the file is found and valid, it overrides the local storage data. This ensures that comments are consistently synchronized with the server's version.

## Contact
For any queries or assistance, please reach out to:

- **Name**: Charl Cronje
- **Email**: [charl@cronje.me](mailto:charl@cronje.me)
- **LinkedIn**: [https://www.linkedin.com/in/charlpcronje](https://www.linkedin.com/in/charlpcronje)
