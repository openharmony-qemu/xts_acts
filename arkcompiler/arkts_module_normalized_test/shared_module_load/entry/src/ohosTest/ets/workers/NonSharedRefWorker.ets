// Worker entry: non-shared-reference (A->B) suite. The worker thread loads its own
// copy of NonSharedA, then posts back `${aMarker}|${bLoadId}` (this thread's A load
// marker + B's load marker read through A)
import { worker, ThreadWorkerGlobalScope, MessageEvents } from '@kit.ArkTS';
import { getALoadMarker, getBLoadIdThroughA } from '../share/NonSharedA';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const reply: string = `${getALoadMarker()}|${getBLoadIdThroughA()}`;
  workerPort.postMessage(reply);
};
