import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker, ArkTSUtils, collections } from '@kit.ArkTS';
import { typeWait07 } from '../atomics';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const data = e.data as typeWait07;
  workerPort.postMessage("wait");
  ArkTSUtils.Atomics.wait(data.ta, 0, 0, 10000);
  ArkTSUtils.Atomics.add(data.ta, 0, 1);
  ArkTSUtils.Atomics.load(data.ta, 0);
  workerPort.postMessage(String(data.ta[0]));
};

workerPort.onmessageerror = (event: MessageEvents) => {
};

workerPort.onerror = (event: ErrorEvent) => {
};
