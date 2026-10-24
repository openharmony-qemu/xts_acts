// Worker entry (plain module, must not be a shared module): singleton suite.
// On receiving a thread name: writes that thread's mark into the shared instance
// (AsyncLock protected) and posts back the loadId read on this thread
import { worker, ThreadWorkerGlobalScope, MessageEvents } from '@kit.ArkTS';
import { sharedState } from '../share/SharedTarget';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const threadName: string = e.data as string;
  sharedState.addThreadMark(threadName).then(() => {
    workerPort.postMessage(sharedState.getLoadId());
  });
};
