import AVFoundation

@objc(CameraPermissionsIos) class CameraPermissionsIos : CDVPlugin{

    // MARK: Properties
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    @Published var isCameraPermission:Bool = false


    //This method is called when the plugin is initialized; plugin setup methods got here
    override func pluginInitialize() {
    }

    /**This method check camera permission on ios
    */
    @objc(getCameraPermission:) func add(_ command: CDVInvokedUrlCommand){
        let status =  AVCaptureDevice.authorizationStatus(for: .video)
        
        switch(status){
        case .authorized:
            isCameraPermission = true
        case .notDetermined:
            await AVCaptureDevice.requestAccess(for: .video){
                if success {
                    print("Permission granted, proceed")
                    isCameraPermission = true
                } else {
                    print("Permission denied")
                    isCameraPermission = false
                }
            }
        case .denied:
            isCameraPermission = false
        case .restricted:
            isCameraPermission = false
            
            
        @unknown default:
            isCameraPermission = false
        }

        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, isCameraPermission: isCameraPermission)
         self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }

    /* This methods accepts 2 int params from ionic app
     Adds the 2 numbers and sends back the sum or error to ionic */
    @objc(add:) func add(_ command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        let param1 = (command.arguments[0] as? NSObject)?.value(forKey: "param1") as? Int
        let param2 = (command.arguments[0] as? NSObject)?.value(forKey: "param2") as? Int

        if let p1 = param1 , let p2 = param2 {
            if p1 >= 0 && p1 >= 0{
                let total = String(p1 + p2)

                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,
                                               messageAs: total)
            } else {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR,
                                               messageAs: "Something wrong")
            }
        }
        self.commandDelegate!.send(pluginResult,
                                   callbackId: command.callbackId)
    }

    /* This methods accepts string messgae from ionic app
     and returns a message */
    @objc(coolMethod:) func coolMethod(_ command: CDVInvokedUrlCommand?) {
        var pluginResult: CDVPluginResult? = nil
        let echo = command?.arguments[0] as? String
        if let echoString = echo{
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "\(echoString)!! from India")
        } else {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        }

        commandDelegate.send(pluginResult, callbackId: command?.callbackId)
    }

}