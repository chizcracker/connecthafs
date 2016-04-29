var UserProfile = React.createClass({
  propTypes: {
    id: React.PropTypes.string,
    name: React.PropTypes.string,
    phonenumber: React.PropTypes.string,
    classyear: React.PropTypes.number,
    address: React.PropTypes.string,
    editmode: React.PropTypes.bool
  },

  _getEditableElement(field, value) {
    var fieldToRequestKeyMap = {
      'Phone Number': 'phoneNumber',
      'Address': 'address',
    };

    return(
      <EditableField
        id={this.props.id}
        field={field}
        value={value}
        editmode={this.props.editmode}
        requestKey={fieldToRequestKeyMap[field]}
      />
    );
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
    var phoneNumberElement = this._getEditableElement(
      'Phone Number',
      this.props.phonenumber,
    );
    var addressElement = this._getEditableElement(
      'Address',
      this.props.address,
    );

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
    requestKey: React.PropTypes.string,
  },

  getInitialState: function() {
    return {
      value: this.props.value,
      editactive: false
    };
  },

  _sendEditRequest: function() {
    var request = new XMLHttpRequest();
    request.open(
      "PUT",
      '/users/' + this.props.id + '?' +
        this.props.requestKey + '=' + this._currentValue,
    );
    request.onreadystatechange = () => {
      if(
        request.readyState === XMLHttpRequest.DONE &&
        request.status === 200
      ) {
        this.setState({
          value: this._currentValue,
          editactive: !this.state.editactive
        });
      }
    };
    request.send();
  },

  _onEditButtonClick: function() {
    if (this.state.editactive) {
      this._sendEditRequest();
    } else {
      this.setState({ editactive: !this.state.editactive });
    }
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
        onClick={this._onEditButtonClick}>
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
