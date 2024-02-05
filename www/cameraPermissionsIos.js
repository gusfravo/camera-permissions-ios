var cameraPermission= {
    getCameraPermission: function(successCallback, errorCallback) {
        Cordova.exec(successCallback, errorCallback, 'CameraPermissionsIos', 'getCameraPermission', []);
    }
}



module.exports = cameraPermission;

// var exec = require('cordova/exec');

// exports.getCameraPermission = function (arg0, success, error) {
//     exec(success, error, 'CameraPermissionsIos', 'getCameraPermission', [arg0]);
// };
