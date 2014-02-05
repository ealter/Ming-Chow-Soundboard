$(document).ready(function() {
    var currentlyPlaying = null;

    var audioDiv = document.getElementById("audioElems");

    function audioTagId(elemId) {
        return elemId + '_audio';
    }

    function createAudioTag(id) {
        var audio = document.createElement("audio");
        audio.src = 'sounds/' + id + ".mp3";
        audio.id = audioTagId(id);
        audio.preload = "auto";
        audioDiv.appendChild(audio);

        $('#' + id).click(function() {
            if(currentlyPlaying != null) {
                currentlyPlaying.pause();
            }
            if(audio.readyState >= 1) {
                audio.currentTime = 0;
                audio.pause();
            }
            audio.play();
            currentlyPlaying = audio;
        });
    }

    $(".soundboardItem").each(function(index, elem) {
        createAudioTag(elem.id);
    });
});

