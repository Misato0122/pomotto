<template>
   <div>
     <div class="modal" @click.self="handleCloseModal(task)">
       <div class="modal-dialog">
         <div class="modal-content">
           <div class="modal-body">
             <div 
              class="task-information d-flex align-items-center justify-content-center"
             >
              <p>現在行っているタスク</p>
             </div>
             <div class="task-information d-flex align-items-center justify-content-center">
               <p>{{ task.title }}</p>
             </div>
             <div class="timer mx-auto">
               <div class="d-flex align-items-center justify-content-center" style="font-size: 100px;">
                <span id="minutes">{{ minutes }}</span>
                <span id:="middle">:</span>
                <span id="seconds">{{ seconds }}</span>
               </div>
            </div>
            <br><br>
            <div id="buttons">
              <v-btn
                color="#ff7171"
                block
                v-if="completeButton"
                @click="handleCreatePomodoro(task)"
              >
                Complete!
              </v-btn>
            </div>
           </div>
           <div class="modal-footer">
             <v-btn
              color="secondary"
              @click="handleCloseModal(task)"
             >
              閉じる
             </v-btn>
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
    alert: 'https://firebasestorage.googleapis.com/v0/b/pomotto.appspot.com/o/Phrase03-1.mp3?alt=media&token=dbcaf4b4-1f40-4829-a4e5-9a16db304880'
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
    this.audio.volume = 1.0
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
  .timer {
    background-color: #9ecca4;
    border-radius: 10px;
    width: 300px;
    height: 150px;
  }
  .task-information{
    height: 40px;
    font-size: 15px;
    color: #810034;
  }
</style>