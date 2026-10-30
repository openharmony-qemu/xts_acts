import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker, ArkTSUtils, collections } from '@kit.ArkTS';
import { typeWait07 } from '../atomics';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const data = e.data as typeWait07;
  workerPort.postMessage("success");
  console.info("wait expect 'not-equal': " + ArkTSUtils.Atomics.wait(data.ta, 2, 2, 10000));
  workerPort.postMessage("end");
};

workerPort.onmessageerror = (event: MessageEvents) => {
};

workerPort.onerror = (event: ErrorEvent) => {
};
