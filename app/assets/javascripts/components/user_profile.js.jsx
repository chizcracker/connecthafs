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
      editactive: false
    };
  },

  _onButtonClick: function(value) {
    this.setState({
      editactive: !this.state.editactive
    });
  },

  render: function() {
    valueElement = <span>{this.props.value}</span>;
    if (this.state.editactive) {
      valueElement = 
        <input
          type="text"
          placeholder={this.props.value}
        />;
    }

    var editButton =
      <input
        type="button"
        onClick={() => this._onButtonClick(valueElement.value)}
        value="Edit"
      />;

    return (
      <div>
        <span>{this.props.field}: </span>
        <form>
          {valueElement}
          {editButton}
        </form>
      </div>
    );
  }
});
