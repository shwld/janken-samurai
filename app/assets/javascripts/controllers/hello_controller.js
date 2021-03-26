import { Controller } from "stimulus"

export default class HelloController extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
