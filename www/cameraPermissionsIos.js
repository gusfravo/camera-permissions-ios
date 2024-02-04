function CameraPermission() {}

CameraPermission.prototype = {
    getCameraPermission: function({}, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'CameraPermissionsIos', 'getCameraPermission', []);
    },
};

module.exports = new CameraPermission();

// var exec = require('cordova/exec');

// exports.getCameraPermission = function (arg0, success, error) {
//     exec(success, error, 'CameraPermissionsIos', 'getCameraPermission', [arg0]);
// };
