import { BusinessError } from '@kit.BasicServicesKit';
import { camera } from '@kit.CameraKit';
import { CameraService } from '../test/CameraService'
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

console.info('worker CameraService start');
let cameraService = new CameraService();
console.info('worker CameraService end ');
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
let status = true;
let isdone = false;
// 自定义消息格式。
interface MessageInfo {
  hasResolve: boolean;
  type: string;
  context: Context; // 注意worker线程中无法使用getContext()直接获取宿主线程context，需要通过消息从宿主线程通信到worker线程使用。
  surfaceId: string;
}

workerPort.onmessage = async (e: MessageEvents) => {
  try {
    const messageInfo: MessageInfo = e.data;
    console.info(`worker onmessage type:${messageInfo.type}`)
    if ('initCamera' === messageInfo.type) {
      // 在worker线程中收到宿主线程初始化相机的消息。
      console.info(`worker initCamera surfaceId:${messageInfo.surfaceId}`)
      // 在worker线程中初始化相机。
     let message = await cameraService.initCamera(messageInfo.context, messageInfo.surfaceId);
      if (message == "success") {
        status = true
      } else {
        status = false
        isdone = true
      }
      workerPort.postMessage({  // 关键：返回结果给主线程
        status: status,
        result: message,
        isdone: isdone,
        type: messageInfo.type
      });
    } else if ('captuePhoto' === messageInfo.type) {
      // 在worker线程中收到宿主线程释放相机的消息。
      console.info('worker captuePhoto.');
      // 在worker线程中释放相机。
      let message = await cameraService.capturePhoto(messageInfo.context);
      if (message == "success") {
        status = true
      } else {
        status = false
        isdone = true
      }
      workerPort.postMessage({  // 关键：返回结果给主线程
        status: status,
        result: message,
        isdone: isdone,
        type: messageInfo.type
      });
    } else if ('releaseCamera' === messageInfo.type) {
      // 在worker线程中收到宿主线程释放相机的消息。
      console.info('worker releaseCamera.');
      // 在worker线程中释放相机。
      let message = await cameraService.releaseCamera();
      console.info('worker releaseCamera.message '+message);
      if (message == "success") {
        status = true
      } else {
        status = false
      }
      isdone = true
      console.info('worker releaseCamera.postMessage start');
      workerPort.postMessage({  // 关键：返回结果给主线程
        status: status,
        result: message,
        isdone: isdone,
        type: messageInfo.type
      });
      console.info('worker releaseCamera.postMessage end');
    }
  } catch(e) {
    console.info('releaseCamera worker try-catch');
  }
}

workerPort.onmessageerror = (e: MessageEvents) => {
  console.info('worker onmessageerror');
}

workerPort.onerror = (e: ErrorEvent) => {
  console.info('worker onerror');
}