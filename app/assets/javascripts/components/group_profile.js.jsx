var GroupProfile = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    address: React.PropTypes.string,
    type: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Name: {this.props.name}</div>
        <div>Address: {this.props.address}</div>
        <div>Type: {this.props.type}</div>
      </div>
    );
  }
});
