export class CommentsManager {
    constructor(videoPlayer, commentsDisplay) {
        this.videoPlayer = videoPlayer;
        this.commentsDisplay = commentsDisplay;
        this.comments = [];
        this.loadConfigAndInit();
    }

    async loadConfigAndInit() {
        try {
            // Fetch and apply video source from config.json
            const configResponse = await fetch('config.json');
            if (configResponse.ok) {
                const configData = await configResponse.json();
                this.setVideoSource(configData.videoFileName);
            } else {
                console.error("config.json file not found. Ensure it exists with a valid video file name.");
            }

            // Attempt to load comments from comments.json
            const commentsResponse = await fetch('comments.json');
            if (commentsResponse.ok) {
                this.comments = await commentsResponse.json();
                localStorage.setItem('videoComments', JSON.stringify(this.comments));
            } else {
                // Fallback to loading comments from localStorage if comments.json is not found
                console.log("comments.json not found, loading comments from localStorage.");
                this.comments = JSON.parse(localStorage.getItem('videoComments')) || [];
            }
        } catch (error) {
            console.error("Error loading configuration or comments:", error);
            this.comments = JSON.parse(localStorage.getItem('videoComments')) || [];
        } finally {
            this.displayComments();
        }
    }

    setVideoSource(fileName) {
        const sourceElement = document.createElement('source');
        sourceElement.setAttribute('src', fileName);
        sourceElement.setAttribute('type', 'video/mp4');
        this.videoPlayer.innerHTML = ''; // Clear any existing sources
        this.videoPlayer.appendChild(sourceElement);
        this.videoPlayer.load(); // Reload video player to apply new source
    }

    displayComments() {
        this.commentsDisplay.innerHTML = this.comments.map(comment =>
            `<div class="comment"><strong>${new Date(comment.time * 1000).toISOString().substr(14, 5)}</strong>: ${comment.text}</div>`
        ).join('');
    }

    addComment(time, text) {
        this.comments.push({ time, text });
        localStorage.setItem('videoComments', JSON.stringify(this.comments));
        this.displayComments();
    }
}
