<script>
import { HorizontalBar } from 'vue-chartjs';
import { ChartDataLabels } from 'chartjs-plugin-datalabels';

export default {
  extends: HorizontalBar,
  plugins: { ChartDataLabels },
  props: {
    datasets: {
      type: Array,
      required: false
    },
    labels: {
      type: Array,
      required: true
    }
  },
  data () {
    return {
      options: {
        scales: {
          xAxes: [{
            ticks: {
              beginAtZero: true,
              stepSize: 2,
              min: 0,
              max: 20
            },
          }],
        }
      }
    }
  },
  mounted() {
    this.renderChart({
      labels: this.labels,
      datasets: [
        {
          label: '１日の合計ポモドーロ数',
          data: this.datasets,
          backgroundColor: "#f25287",
          datalabels: {
            color: 'black',
            anchor: 'end',
            formatter: function(value, context) {
              if (value >= 1) {
              return '合計 ' + (value * 25) + '分'
              }
            }
          }
        }
      ]
    }, this.options)
  }
}
</script>