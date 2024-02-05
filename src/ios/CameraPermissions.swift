import AVFoundation

@objc(CameraPermissionsIos) 
class CameraPermissionsIos : CDVPlugin{

    // MARK: Properties
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    var isCameraPermission:Bool = false


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
            isCameraPermission = true
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
              if granted {
                print("granted")
                  self.isCameraPermission = true
              }
              else {
                print("not granted")
                  self.isCameraPermission = false
              }
            })
            /*var success =  AVCaptureDevice.requestAccess(for: .video)
            if success {
                print("Permission granted, proceed")
                isCameraPermission = true
            } else {
                print("Permission denied")
                isCameraPermission = false
            }*/
            //isCameraPermission = true
        case .denied:
            isCameraPermission = false
        case .restricted:
            isCameraPermission = false
            
            
        @unknown default:
            isCameraPermission = false
        }

        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: isCameraPermission)
         self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }



}
