import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker, ArkTSUtils, collections } from '@kit.ArkTS';
import { typeWait11 } from '../atomics';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const data = e.data as typeWait11;
  const int32 = new collections.Uint32Array(data.sab);
  for (let i = 0; i < 10; ++i) {
    ArkTSUtils.Atomics.add(int32, 0, 1);
  }
  workerPort.postMessage("031");
};

workerPort.onmessageerror = (event: MessageEvents) => {
};

workerPort.onerror = (event: ErrorEvent) => {
};
