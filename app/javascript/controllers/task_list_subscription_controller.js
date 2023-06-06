import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { taskListId: Number }
  static targets = ["tasks"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "TaskListChannel", id: this.taskListIdValue },
      { received: data => this.tasksTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.taskListIdValue}.`)
  }


  // #insertTaskListAndScrollDown(data) {
  //   this.taskListsTarget.insertAdjacentHTML("beforeend", data)
  //   this.taskListsTarget.scrollTo(0, this.taskListTarget.scrollHeight)
  // }
}
