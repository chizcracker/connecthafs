class Request {
  constructor(url) {
    this._request = new XMLHttpRequest();
    this._url = url;
  }

  setMethod(method) {
    this._method = method;
    return this; 
  }

  setResponseHandler(responseCallback) {
    this._responseCallback = responseCallback;
    return this;
  }

  setErrorHandler(errorCallback) {
    this._errorCallback = errorCallback;
    return this;
  }

  setAbortHandler(abortCallback) {
    this._abortCallback = abortCallback;
    return this;
  }

  _userAborted() {
    return !this._request.getAllResponseHeaders();
  }

  send() {
    var request = this._request;
    request.open(
      this._method,
      this._url
    );
    request.onreadystatechange = () => {
      if (request.readyState === XMLHttpRequest.DONE) {
        if (request.status === 200) {
          // Successful request
          if (this._responseCallback) {
            this._responseCallback();
          }
        } else {
          if (this._userAborted()) {
            // User aborted request
            if (this._abortCallback) {
              this._abortCallback();
            }
          } else {
            // Non-successful request
            if (this._errorCallback) {
              this._errorCallback();
            }
          }
        }
      }
    };
    request.send();
  }
}
