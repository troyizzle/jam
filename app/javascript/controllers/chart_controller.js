import { Controller } from "@hotwired/stimulus"
import chartkick from "chartkick"

// Connects to data-controller="chart"
export default class extends Controller {
  static targets = ["chart", "report"]

  connect() {
    this.chart = new chartkick.LineChart(this.chartTarget, this.data2(), {
      scales: {
        xAxes: [{
          display: false
        }]
      },
    })
  }

  reportTargetConnected() {
    if (this.chart) {
      this.chart.updateData(this.data)
    }
  }

  reportTargetDisconnected() {
    if (this.chart) {
      this.chart.updateData(this.data)
    }
  }

  data2() {
    const data =  this.reportTargets.map((report) =>
      [report.dataset.value, report.dataset.value]
    )
    console.log(data)
    return data
  }

  get data() {
    let data = {}

    this.reportTargets.forEach((report) => {
      data[report.dataset.date] = report.dataset.value
    })

    return data
  }
}
