import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview"
export default class extends Controller {
  static targets = ["photo", "preview"]

  connect() {
    this.imageFiles = new DataTransfer();
  }

  updateInput() {
    console.log(this.imageFiles);
    console.log(this.imageFiles.files);
    this.photoTarget.files = this.imageFiles.files
    console.log(this.photoTarget.files);
  }

  displayPreview(event) {

    // Get all the image files into an array
    const files = Array.from(event.target.files);

    // For each file
    files.forEach(file => {

      // Add file to the DataTransfer
      this.imageFiles.items.add(file)

      // Create Div for Card
      const previewDiv = document.createElement("div");

      // Create Image and Delete Button
      const peviewImg = document.createElement("img");
      const peviewDel = document.createElement("div");


      // Create Image Preview
      peviewImg.src = URL.createObjectURL(file);

      // Attach Image and Delete Button to Div
      peviewImg.classList.add("img-list-sm");
      peviewImg.alt = "Preview Image";

      previewDiv.appendChild(peviewImg);

      peviewDel.innerText = "-";
      peviewDel.dataset.action = "click->preview#removeItem"
      peviewDel.classList.add("delete-card");
      previewDiv.appendChild(peviewDel);

      // Attach Card to Preview Div
      this.previewTarget.appendChild(previewDiv);
    });

    this.updateInput();
  }

  removeItem(event) {
    const itemToRemove = event.target.parentElement;
    const childrenArray = this.previewTarget.children;
    let removeIndex = -1
    for (let i = 0; i < childrenArray.length; i++) {
      if (childrenArray[i] === itemToRemove) {
        removeIndex = i
      };
    };
    this.imageFiles.items.remove(removeIndex)
    this.photoTarget.files = this.imageFiles.files
    this.previewTarget.removeChild(this.previewTarget.children[removeIndex]);
  }
}
