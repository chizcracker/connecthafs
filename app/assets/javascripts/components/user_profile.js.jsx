var UserProfile = React.createClass({
  propTypes: {
    id: React.PropTypes.string,
    name: React.PropTypes.string,
    phonenumber: React.PropTypes.string,
    classyear: React.PropTypes.number,
    address: React.PropTypes.string,
    editmode: React.PropTypes.bool
  },

  render: function() {
    // Non-editables
    var name =
      <div>
        <span>Name: {this.props.name}</span>
      </div>;

    var classYear =
      <div>
        <span>Class Year: {this.props.classyear}</span>
      </div>;

    // Editables
    var phoneNumberField = 'Phone Number';
    var phoneNumberValue = this.props.phonenumber;
    var phoneNumberElement =
      <EditableField
        id={this.props.id}
        field={phoneNumberField}
        value={phoneNumberValue}
        editmode={this.props.editmode}
      />;

    var addressField = 'Address';
    var addressValue = this.props.address;
    var addressElement =
      <EditableField
        id={this.props.id}
        field={addressField}
        value={addressValue}
        editmode={this.props.editmode}
      />;
        
    return (
      <div>
        {name}
        {phoneNumberElement}
        {classYear}
        {addressElement}
      </div>
    );
  }
});

var EditableField = React.createClass({
  propTypes: {
    id: React.PropTypes.string,
    field: React.PropTypes.string,
    value: React.PropTypes.oneOfType([
      React.PropTypes.string,
      React.PropTypes.number
    ]),
    editmode: React.PropTypes.bool,
  },

  getInitialState: function() {
    return {
      value: this.props.value,
      editactive: false
    };
  },

  _sendRequest: function() {
    // TODO: Add necessary query params and test that it
    // works once backend is ready. Also, new value (in
    // _onButtonClick function) should only be set on
    // SUCCESS case.

    if (this.state.editactive) {
      var request = new XMLHttpRequest();
      request.open("PUT", "/users/" + this.props.id);
      request.onreadystatechange = function() {
        if(request.readyState === XMLHttpRequest.DONE &&
           request.status === 200) {
          // SUCCESS
        }
      };
      request.send();
    }
  },

  _onButtonClick: function() {
    // this._sendRequest();

    this.setState({
      value: this._currentValue,
      editactive: !this.state.editactive
    });
  },

  render: function() {
    valueElement = <span>{this.state.value}</span>;
    if (this.state.editactive) {
      valueElement = 
        <input
          type="text"
          placeholder={this.state.value}
          onChange={(e) => {
            this._currentValue = e.target.value;
          }}
        />;
    }

    var editButton =
      <button
        type="button"
        onClick={this._onButtonClick}>
        Edit
      </button>;

    return (
      <div>
        <span>{this.props.field}: </span>
        {valueElement}
        {editButton}
      </div>
    );
  }
});
