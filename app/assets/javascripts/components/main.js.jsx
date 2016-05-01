var Main = React.createClass({

  render: function() {
    return (
      <div>
        <button>
          Send e-mail to all selected.
        </button>
        <div>
          <input
            type="text"
            placeholder="Type in search key"
          />
          <button>
            Search
          </button>
        </div>
      </div> 
    );
  }
});
