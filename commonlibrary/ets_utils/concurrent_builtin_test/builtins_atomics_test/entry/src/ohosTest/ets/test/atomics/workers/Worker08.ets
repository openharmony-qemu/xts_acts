import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { typeWait07 } from '../atomics';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const data = e.data as typeWait07;
  let begTime = new Date().getTime();
  workerPort.postMessage("success");
  console.info("wait expect 'timed-out' : " + Atomics.wait(data.ta, 1, 0, 3000));
  let endTime = new Date().getTime();
  if (endTime - begTime < 3000) {
    workerPort.postMessage("end1");
  } else {
    workerPort.postMessage("end2");
  }
};

workerPort.onmessageerror = (event: MessageEvents) => {
};

workerPort.onerror = (event: ErrorEvent) => {
};
