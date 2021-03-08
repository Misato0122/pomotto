<template>
   <div>
     <div class="modal" @click.self="handleCloseModal(task)">
       <div class="modal-dialog">
         <div class="modal-content">
           <div class="modal-header">
             <h4 class="modal-title">{{ task.title }}</h4>
             <button type="button" class="close" v-on:click="handleCloseModal(task)">×</button>
           </div>
           <div class="modal-body">
             <div class="task-information">

             </div>
             <div class="timer">
              <span id="minutes">{{ minutes }}</span>
              <span id:="middle">:</span>
              <span id="seconds">{{ seconds }}</span>
            </div>
            <div id="buttons">
              <button 
                v-if="completeButton"
                @click="handleCreatePomodoro(task)"
              >
              complete!
              </button>
            </div>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary">フッターのボタンなど</button>
           </div>
         </div>
       </div>
     </div>
     <div class="modal-backdrop show"></div>
   </div>
</template>

<script>
import { Howl } from 'howler';


const soundUrl = {
    alert: 'https://firebasestorage.googleapis.com/v0/b/pomotto.appspot.com/o/Clock-Alarm05-1.mp3?alt=media&token=5a9927bd-48c7-4680-b74c-bf4df73d370b'
}

export default {
  name: 'PomodoroTimer',
  props: {
    task: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      timer: null,
      totalTime: 0,
      startButton: true,
      completeButton: false,
      audio: null
    }
  },
  created() {
    this.startTimer();
    console.log(this.totalTime);
  },
  mounted() {
    this.audio = new Howl({ src: soundUrl.alert })
  },
  methods: {
    fetchTime: function() {
      if(localStorage.getItem('totalSeconds')) {
        this.totalTime = parseInt(localStorage.getItem('totalSeconds'))
      } else {
        this.totalTime = 1 * 3
      }
    },
    startTimer() {
      this.fetchTime();
      this.timer = setInterval(() => this.countdown(), 1000);
      this.startButton = false
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
    stopAlert() {
      if(localStorage.getItem('alert')) {
        this.audio.pause();
        localStorage.removeItem('alert')
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
        this.completeButton = true;
      }
    },
    handleCloseModal(task) {
      this.$emit('close-modal', this.task);
    },
    handleCreatePomodoro(task) {
      localStorage.removeItem('totalSeconds'),
      localStorage.removeItem('pomodoroTask'),
      this.$emit('createPomodoro', task)
      this.stopAlert();
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
  .modal {
  display: block;
  }
</style>