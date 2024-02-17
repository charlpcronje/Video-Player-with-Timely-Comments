#!/bin/bash

# Define the base directory for the project
BASE_DIR=${1:-$(pwd)}

# Create the directory structure
mkdir -p "$BASE_DIR"/{js,css}

# Navigate to the base directory
cd "$BASE_DIR"

# Create the HTML file
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Video Player</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div id="commentsDisplay" class="comments-display"></div>
    <video id="videoPlayer" controls class="video-player">
        <source src="your_video.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <div id="commentForm" class="comment-form">
        <textarea id="commentText" placeholder="Enter your comment..."></textarea>
        <button id="saveComment">Save Comment</button>
    </div>
    <button id="exportComments" class="export-comments">Export Comments</button>

    <script src="js/global.js"></script>
    <script type="module" src="js/EventBinder.js"></script>
</body>
</html>
EOF

# Create the JavaScript files
# global.js
cat > js/global.js <<EOF
window.$$ = selector => document.querySelector(selector);
window.$$$ = selector => document.querySelectorAll(selector);
window.event = (element, eventName, handler) => element.addEventListener(eventName, handler);
EOF

# CommentsManager.js
cat > js/CommentsManager.js <<EOF
export class CommentsManager {
    constructor(videoPlayer, commentsDisplay) {
        this.videoPlayer = videoPlayer;
        this.commentsDisplay = commentsDisplay;
        this.comments = JSON.parse(localStorage.getItem('videoComments')) || [];
    }

    displayComments() {
        this.commentsDisplay.innerHTML = this.comments.map(comment => 
            \`<div class="comment"><strong>\${new Date(comment.time * 1000).toISOString().substr(14, 5)}</strong>: \${comment.text}</div>\`
        ).join('');
    }

    addComment(time, text) {
        this.comments.push({ time, text });
        localStorage.setItem('videoComments', JSON.stringify(this.comments));
        this.displayComments();
    }
}
EOF

# EventBinder.js
cat > js/EventBinder.js <<EOF
import { CommentsManager } from './CommentsManager.js';

document.addEventListener('DOMContentLoaded', () => {
    const videoPlayer = $$('video#videoPlayer');
    const commentsDisplay = $$('div#commentsDisplay');
    const commentsManager = new CommentsManager(videoPlayer, commentsDisplay);

    // Example event binding
    event($$('button#saveComment'), 'click', () => {
        const commentText = $$('textarea#commentText').value;
        const currentTime = videoPlayer.currentTime;
        commentsManager.addComment(currentTime, commentText);
    });

    // Initialize display of comments
    commentsManager.displayComments();
});
EOF

# Create the CSS file
cat > css/styles.css <<EOF
body {
    font-family: 'Nunito', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.video-player {
    margin-top: 100px; /* Ensures video is 100px from the top */
    width: 80%; /* Adjust based on preference */
    max-width: 800px;
}

.comments-display {
    position: fixed;
    top: 0;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
    color: white;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
    padding: 10px;
    box-sizing: border-box;
    z-index: 2; /* Ensures comments are above the video */
    font-size: 16px; /* Readable font size for phones */
}

.comment-form, .export-comments {
    margin-top: 20px;
}
EOF

echo "Project setup is complete. Files created in $BASE_DIR"
#!/bin/bash

# Define the base directory for the project
BASE_DIR=${1:-$(pwd)}

# Create the directory structure
mkdir -p "$BASE_DIR"/{js,css}

# Navigate to the base directory
cd "$BASE_DIR"

# Create the HTML file
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Video Player</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div id="commentsDisplay" class="comments-display"></div>
    <video id="videoPlayer" controls class="video-player">
        <source src="your_video.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <div id="commentForm" class="comment-form">
        <textarea id="commentText" placeholder="Enter your comment..."></textarea>
        <button id="saveComment">Save Comment</button>
    </div>
    <button id="exportComments" class="export-comments">Export Comments</button>

    <script src="js/global.js"></script>
    <script type="module" src="js/EventBinder.js"></script>
</body>
</html>
EOF

# Create the JavaScript files
# global.js
cat > js/global.js <<EOF
window.$$ = selector => document.querySelector(selector);
window.$$$ = selector => document.querySelectorAll(selector);
window.event = (element, eventName, handler) => element.addEventListener(eventName, handler);
EOF

# CommentsManager.js
cat > js/CommentsManager.js <<EOF
export class CommentsManager {
    constructor(videoPlayer, commentsDisplay) {
        this.videoPlayer = videoPlayer;
        this.commentsDisplay = commentsDisplay;
        this.comments = JSON.parse(localStorage.getItem('videoComments')) || [];
    }

    displayComments() {
        this.commentsDisplay.innerHTML = this.comments.map(comment => 
            \`<div class="comment"><strong>\${new Date(comment.time * 1000).toISOString().substr(14, 5)}</strong>: \${comment.text}</div>\`
        ).join('');
    }

    addComment(time, text) {
        this.comments.push({ time, text });
        localStorage.setItem('videoComments', JSON.stringify(this.comments));
        this.displayComments();
    }
}
EOF

# EventBinder.js
cat > js/EventBinder.js <<EOF
import { CommentsManager } from './CommentsManager.js';

document.addEventListener('DOMContentLoaded', () => {
    const videoPlayer = $$('video#videoPlayer');
    const commentsDisplay = $$('div#commentsDisplay');
    const commentsManager = new CommentsManager(videoPlayer, commentsDisplay);

    // Example event binding
    event($$('button#saveComment'), 'click', () => {
        const commentText = $$('textarea#commentText').value;
        const currentTime = videoPlayer.currentTime;
        commentsManager.addComment(currentTime, commentText);
    });

    // Initialize display of comments
    commentsManager.displayComments();
});
EOF

# Create the CSS file
cat > css/styles.css <<EOF
body {
    font-family: 'Nunito', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.video-player {
    margin-top: 100px; /* Ensures video is 100px from the top */
    width: 80%; /* Adjust based on preference */
    max-width: 800px;
}

.comments-display {
    position: fixed;
    top: 0;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
    color: white;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
    padding: 10px;
    box-sizing: border-box;
    z-index: 2; /* Ensures comments are above the video */
    font-size: 16px; /* Readable font size for phones */
}

.comment-form, .export-comments {
    margin-top: 20px;
}
EOF

echo "Project setup is complete. Files created in $BASE_DIR"
