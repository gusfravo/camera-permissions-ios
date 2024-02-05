import AVFoundation

@objc(CameraPermissionsIos)
class CameraPermissionsIos : CDVPlugin{

    // MARK: Properties
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    var isCameraPermission:String = "denied"


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
            isCameraPermission = "granted";
        case .notDetermined:
            // AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            //   if granted {
            //     print("granted")
            //       self.isCameraPermission = true
            //   }
            //   else {
            //     print("not granted")
            //       self.isCameraPermission = false
            //   }
            // })
            /*var success =  AVCaptureDevice.requestAccess(for: .video)
            if success {
                print("Permission granted, proceed")
                isCameraPermission = true
            } else {
                print("Permission denied")
                isCameraPermission = false
            }*/
            isCameraPermission = "notDetermined"
        case .denied:
            isCameraPermission = "denied"
        case .restricted:
            isCameraPermission = "denied"
            
            
        @unknown default:
            isCameraPermission = "denied"
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
                print("granted")
                isCameraPermission = "granted"
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: isCameraPermission)
                 self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
            }
            else {
                print("not granted")
                isCameraPermission = "denied"
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: isCameraPermission)
                 self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
            }
        })
    }




}
