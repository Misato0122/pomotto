<template>
  <div>
    <div class="timer">
      <span>タスク実行中   </span>
      <span id="minutes">{{ minutes }}</span>
      <span id:="middle">:</span>
      <span id="seconds">{{ seconds }}</span>
      <button
        class="btn btn-secondary"
        @click="handleOpenPomodoroTimerModal(task)"
      >タスク</button>
    </div>
  </div>
</template>

<script>
import { Howl } from 'howler';

const soundUrl = {
    alert: 'https://firebasestorage.googleapis.com/v0/b/pomotto.appspot.com/o/Clock-Alarm05-1.mp3?alt=media&token=5a9927bd-48c7-4680-b74c-bf4df73d370b'
}

export default {
  name: "PomodoroTimerBlock",
    data() {
    return {
      task: {},
      totalTime: 0,
      timer: null,
      audio: null
    }
  },
  created() {
    this.startTimer();
    this.task = JSON.parse(localStorage.getItem('pomodoroTask'))
    console.log(this.task)
  },
  mounted() {
    this.audio = new Howl({ src: soundUrl.alert })
  },
  methods: {
    fetchTime: function() {
      if(localStorage.getItem('totalSeconds')) {
        this.totalTime = parseInt(localStorage.getItem('totalSeconds'))
      } else {
        this.totalTime = 1 * 5
      }
    },
    startTimer() {
      this.fetchTime();
      this.timer = setInterval(() => this.countdown(), 1000);
    },
    resetTimer() {
      clearInterval(this.timer);
    },
    startAlert() {
      if(!localStorage.getItem('alert')) {
        this.audio.play();
        localStorage.alert = "1"
      }
    },
    padTime(time) {
      return (time < 10 ? "0" : "") + time;
    },
    countdown() {
      if(this.totalTime >= 1) {
        this.totalTime--;
        localStorage.totalSeconds = this.totalTime
      } else {
        this.totalTime = 0;
        this.resetTimer();
        this.startAlert();
      }
    },
    handleOpenPomodoroTimerModal(task) {
      this.$emit('openPomodoroTimerModal', this.task)
    }
  },
  computed: {
    minutes: function() {
      const minutes = Math.floor(this.totalTime / 60);
      return this.padTime(minutes);
    },
    seconds: function() {
      const seconds = this.totalTime - this.minutes * 60;
      return this.padTime(seconds);
    }
  }
}
</script>

<style scoped>
  .timer{
    background-color: greenyellow;
  }
</style>