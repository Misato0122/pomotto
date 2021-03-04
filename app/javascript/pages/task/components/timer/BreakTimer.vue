<template>
  <div>
    <div class="timer">
      <span>休憩時間   </span>
      <span id="minutes">{{ minutes }}</span>
      <span id:="middle">:</span>
      <span id="seconds">{{ seconds }}</span>
    </div>
  </div>
</template>

<script>
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
  }
</style>