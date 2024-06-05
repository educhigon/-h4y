import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="print-tags"
export default class extends Controller {
  static targets = [ "tagCheckbox", "printHere" ]

  connect() {
    console.log("bonjour");
    console.log(this.element);
    console.log("hi");
    console.log(this.tagCheckboxTargets);
    console.log("🌈");
  }

  select() {
    console.log("ciao");
    var tags = []
    this.tagCheckboxTargets.forEach( (checkbox) => {
      if (checkbox.checked) {
        console.log(checkbox.nextSibling.innerText);
        tags.push(checkbox.nextSibling.innerText)
        console.log(tags);
      }
    })
    this.printHereTarget.innerText = ""
    const divider = "<div class='divider'></div>"
    this.printHereTarget.insertAdjacentHTML("beforeend", divider)
    tags.forEach((tag) => {
      const fakeTag = `
      <label class="imitation">
      ${tag}
      </label>`
      this.printHereTarget.insertAdjacentHTML("beforeend", fakeTag)
    })
  }
}
