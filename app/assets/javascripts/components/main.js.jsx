var Main = React.createClass({
  propTypes: {
    results: React.PropTypes.array
  },

  render: function() {
    var userRows = this.props.results.map(function(user) {
      return (
        <UserRow
          // Assigning a key to avoid
          // https://fb.me/react-warning-keys
          key={user.id}
          user={user}
        />
      );
    });

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
        {userRows}
      </div> 
    );
  }
});

var UserRow = React.createClass({
  propTypes: {
    user: React.PropTypes.object
  },

  render: function() {
    var user = this.props.user;
    return (
      <div style={{ border: '2px solid green', marginTop: '10px', width: '200px' }}>
        <a href={'/users/' + user.id}>{user.name}</a><br />
        {user.address}<br />
        {user.phone_number}<br />
        {user.class_year}<br />
      </div>
    );
  }
});
