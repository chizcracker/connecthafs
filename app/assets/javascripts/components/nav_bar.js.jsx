var NavBar = React.createClass({
  propTypes: {
    currentUser: React.PropTypes.object
  },

  render: function() {
    // TODO: move all styles to css

    var listStyle = {
      color: 'white',
      float: 'left',
      listStyle: 'none',
      backgroundColor: '#000000',
      marginRight: '30px',
      width: '150px',
      textDecoration: 'none',
      textAlign: 'center',
    };

    return (
      <ul style={{ display: 'inline' }}>
        <a href="#">
          <li style={listStyle}>Main</li>
        </a>
        <li style={listStyle}>Announcements</li>
        <a href={'/users/' + this.props.currentUser.id}>
          <li style={listStyle}>My Profile</li>
        </a>
        <li style={listStyle}>Contact</li>
      </ul>
    );
  }
});
