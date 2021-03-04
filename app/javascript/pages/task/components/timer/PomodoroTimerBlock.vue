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
export default {
  name: "PomodoroTimerBlock",
    data() {
    return {
      task: {},
      totalTime: 0,
      timer: null
    }
  },
  created() {
    this.startTimer();
    this.task = JSON.parse(localStorage.getItem('pomodoroTask'))
    console.log(this.task)
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