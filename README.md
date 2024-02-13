# camera-permissions-ios
Plugin to check camera permission on ios
Camera Permissions iOS
========

This plugin is designed to support iOS's permissions checking camera access

The iOS permissions camera checking mechanism changed. In the past, permissions were granted by users when they decided to install the app.
Now the permissions should be granted by users when they are using the app.

Installation
--------

```bash
cordova plugin add camera-permissions-ios
```

※ Support iOS 

Usage
--------

### API

```javascript
var permissions = cordova.plugins.cameraPermissionsIos;
permissions.getCameraPermission({}, successCallback, errorCallback);
permissions.requestCameraPermission({}, successCallback, errorCallback);
```

## Examples
```js
var permissions = cordova.plugins.cameraPermissionsIos;
```

#### Quick check
```js

permissions.getCameraPermission({}, function( status ){
  if ( status == 'granted') {
    console.log("Yes");
  }
  else {
    console.warn("No");
  }
});
```
**Status Availables
**
There are 3 status availables and it dependes of the camera access from iOS Device.
* granted - A status that indicates the user has explicitly granted an app permission to capture media.
* denied - A status that indicates the user has explicitly denied an app permission to capture media.
* notDetermined - A status that indicates the user hasn’t yet granted or denied authorization.

#### Quick request
```js
permissions.requestCameraPermission({}, success, error);

function error() {
  console.warn('Camera permission is not turned on');
}

function success( status ) {
  if( status == 'denied' ) error();
  if(status == 'granted') console.log("Camera permission turned on");
}
```

**Status Availables
**
There are 3 status availables and it dependes of the camera access from iOS Device.
* granted - A status that indicates the user has explicitly granted an app permission to capture media.
* denied - A status that indicates the user has explicitly denied an app permission to capture media.
* notDetermined - A status that indicates the user hasn’t yet granted or denied authorization.
