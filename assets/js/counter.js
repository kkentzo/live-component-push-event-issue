function Counter() {

  this.mounted = function() {
    this.id = this.el.dataset.id
    console.log("mounted:", this.id)
    this.handleEvent("increased", this.handler())
  }

  this.handler = function() {
    return (payload) => {
      console.log(this.id+ " increased  -- payload=", JSON.stringify(payload))
    }
  }
}


export default Counter;
