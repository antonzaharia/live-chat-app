import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['modal']

  connect() {
    this.modalTarget.showModal()
  }

  close(e) {
    e.preventDefault()
    this.modalTarget.closest('#modal').innerHTML = ''
  }
}
