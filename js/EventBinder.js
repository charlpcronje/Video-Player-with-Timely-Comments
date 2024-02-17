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
