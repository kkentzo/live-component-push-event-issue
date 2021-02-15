function Counter() {

  this.mounted = function() {
    this.id = this.el.dataset.id
    console.log("mounted:", this.id)
    this.handleEvent("ping", this.handler())
  }

  this.handler = function() {
    return (payload) => {
      console.log("hook", this.id, "received message with payload", JSON.stringify(payload))
    }
  }
}


export default Counter;
