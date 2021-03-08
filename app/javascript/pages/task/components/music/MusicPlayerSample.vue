<template>
    <div id="player">
        <div id="play" v-if="isPlay == false"
            @click="play()">再生
        </div>
        <div id="stop" v-else
            @click="stop()">停止
        </div>
    </div>
</template>

<script>
import { Howl } from 'howler';

const soundUrl = {
    alert: 'https://firebasestorage.googleapis.com/v0/b/pomotto.appspot.com/o/Clock-Alarm05-1.mp3?alt=media&token=5a9927bd-48c7-4680-b74c-bf4df73d370b'
}
export default {
    name: 'player',
    data: function () {
        return {
            audio: null,
            isPlay: false,
        }
    },
    mounted: function () {
        this.audio = new Howl({ src: soundUrl.alert })
    },
    methods: {
        play: function () {
            this.audio.play();
            this.isPlay = true;
        },
        stop: function () {
            this.audio.pause();
            this.isPlay = false;
        }
    }
}
</script>

<style scoped>
</style>
