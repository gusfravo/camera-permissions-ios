import AVFoundation

@objc(CameraPermissionsIos)
class CameraPermissionsIos : CDVPlugin{
    enum PermissionType:String {
        case granted = "granted"
        case denied = "denied"
        case notDetermined = "notDetermined"
    }
    // MARK: Properties
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    var isCameraPermission:String = PermissionType.denied.rawValue;


    //This method is called when the plugin is initialized; plugin setup methods got here
    override func pluginInitialize() {
    }

    /**This method check camera permission on ios
    */
    @objc(getCameraPermission:)
    func getCameraPermission(_ command: CDVInvokedUrlCommand) {
        let status =  AVCaptureDevice.authorizationStatus(for: .video)
        
        switch(status){
        case .authorized:
            isCameraPermission = PermissionType.granted.rawValue;
        case .notDetermined:
            isCameraPermission = PermissionType.notDetermined.rawValue;
        case .denied:
            isCameraPermission = PermissionType.denied.rawValue;
        case .restricted:
            isCameraPermission = PermissionType.denied.rawValue;
            
            
        @unknown default:
            isCameraPermission = PermissionType.denied.rawValue;
        }

        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: isCameraPermission)
         self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    /**
    This method request access to camera permissions on ios*/

    @objc(requestCameraPermission:)
    func requestCameraPermission(_ command: CDVInvokedUrlCommand) {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { [self] (granted: Bool) in
            if granted {
                isCameraPermission = PermissionType.granted.rawValue;
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: isCameraPermission)
                 self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
            }
            else {
                isCameraPermission = PermissionType.denied.rawValue;
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: isCameraPermission)
                 self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
            }
        })
    }




}
