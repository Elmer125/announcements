import { Controller } from "@hotwired/stimulus"



export default class extends Controller {

  connect() {

  }
  clickButton(e){
    //e.preventDefault();
    const checkboxID=e.params["checkbox"];
    const checkbox=document.getElementById(checkboxID);
    checkbox.checked=!checkbox.checked;
  }
}