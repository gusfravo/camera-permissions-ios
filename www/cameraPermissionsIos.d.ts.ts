export interface CameraPermissionStatus  {
    status:string,
    isCameraPermission:boolean
}

export interface CameraPermission {

    getCameraPermission: (
        successCallback: (status: CameraPermissionStatus) => void,
        errorCallback: () => void
      ) => void;

}