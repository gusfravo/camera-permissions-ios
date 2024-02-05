var cameraPermissionsIos = {
    getCameraPermission: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'CameraPermissionsIos', 'getCameraPermission', []);
    },
}


module.exports =  cameraPermissionsIos;