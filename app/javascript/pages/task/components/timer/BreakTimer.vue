<template>
  <div>
    <div class="timer d-flex align-items-center justify-content-center">
      <span>休憩時間   </span>
      <span id="minutes">{{ minutes }}</span>
      <span id:="middle">:</span>
      <span id="seconds">{{ seconds }}</span>
    </div>
  </div>
</template>

<script>
import { Howl } from 'howler';

const soundUrl = {
    alert: 'https://firebasestorage.googleapis.com/v0/b/pomotto.appspot.com/o/News-Accent04-2.mp3?alt=media&token=dcf7a01e-829d-444e-a054-dc060c74f664'
    }

export default {
  name: "BreakTimerBlock",
    data() {
    return {
      totalTime: 0,
      timer: null
    }
  },
  created() {
    this.startTimer();
    console.log(this.totalTime);
  },
  mounted() {
    this.audio = new Howl({ src: soundUrl.alert })
    this.audio.volume = 1.0
  },
  methods: {
    fetchTime: function() {
      if(localStorage.getItem('breakSeconds')) {
        this.totalTime = parseInt(localStorage.getItem('breakSeconds'))
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
    padTime(time) {
      return (time < 10 ? "0" : "") + time;
    },
    closeBreakTimer() {
      this.$emit('closeBreakTimer');
    },
    countdown() {
      if(this.totalTime >= 1) {
        this.totalTime--;
        localStorage.breakSeconds = this.totalTime
      } else {
        this.totalTime = 0;
        this.resetTimer();
        this.closeBreakTimer();
        localStorage.removeItem('breakSeconds')
        this.audio.play();
      }
    },
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
    background-color: pink;
    border-radius: 10px;
    width: 300px;
  }
</style>