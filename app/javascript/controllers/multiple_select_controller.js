import { Controller } from '@hotwired/stimulus'
import TomSelect from 'tom-select'

// Connects to data-controller="multiple-select"
export default class extends Controller {
  static targets = ['select']
  connect() {}

  selectTargetConnected(element) {
    new TomSelect(element, {
      plugins: ['remove_button'],
    })
  }
}
