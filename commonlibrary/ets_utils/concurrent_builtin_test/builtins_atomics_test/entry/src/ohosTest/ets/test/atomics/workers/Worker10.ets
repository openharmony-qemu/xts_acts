import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { typeWait07 } from '../atomics';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const data = e.data as typeWait07;
  workerPort.postMessage("wait");
  Atomics.wait(data.ta, 0, 0);
  Atomics.add(data.ta, 0, 1);
  Atomics.load(data.ta, 0);
  workerPort.postMessage(String(data.ta[0]));
};

workerPort.onmessageerror = (event: MessageEvents) => {
};

workerPort.onerror = (event: ErrorEvent) => {
};
