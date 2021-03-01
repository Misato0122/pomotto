<template>
   <div>
     <div class="modal" @click.self="handleCloseModal">
       <div class="modal-dialog">
         <div class="modal-content">
           <div class="modal-header">
             <h4 class="modal-title">{{ task.title }}</h4>
             <button type="button" class="close" v-on:click="handleCloseModal">×</button>
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
      totalTime: 1 * 5,
      startButton: true,
      completeButton: false,
    }
  },
  created() {
    this.startTimer();
  },
  methods: {
    startTimer() {
      setInterval(() => this.countdown(), 1000);
      this.startButton = false
    },
    resetTimer() {
      clearInterval(() => this.countdown());
    },
    padTime(time) {
      return (time < 10 ? "0" : "") + time;
    },
    countdown() {
      if(this.totalTime >= 1) {
        this.totalTime--;
      } else {
        this.totalTime = 0;
        this.resetTimer();
        this.completeButton = true;
      }
    },
    handleCloseModal() {
      this.$emit('close-modal');
    },
    handleCreatePomodoro(task) {
      this.$emit('createPomodoro', task)
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