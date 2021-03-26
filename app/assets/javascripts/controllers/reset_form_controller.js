import { Controller } from "stimulus"

export default class ResetFormController extends Controller {
  reset() {
    this.element.reset()
  }
}
