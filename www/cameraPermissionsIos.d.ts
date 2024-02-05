export interface CameraPermissionStatus  {
    status:string,
    isCameraPermission:boolean
}

export interface CameraPermissionsIos {

    getCameraPermission: (
        successCallback: (status: CameraPermissionStatus) => void,
        errorCallback: () => void
      ) => void;

    requestCameraPermission: (
        successCallback: (status: CameraPermissionStatus) => void,
        errorCallback: () => void
    ) => void;

}