var cameraPermissionsIos = {
    getCameraPermission: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'CameraPermissionsIos', 'getCameraPermission', []);
    },

    requestCameraPermission: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'CameraPermissionsIos', 'requestCameraPermission', []);
    },
}


module.exports =  cameraPermissionsIos;