// Worker entry: lazy-loading (C->D) suite. Command protocol:
// 'bind'  — only binds C without accessing D, posts back 'bound' (verifies that
//           binding alone does not load)
// 'check' — accesses D through C's gateway, triggering this thread's lazy load,
//           and posts back the dMarker
import { worker, ThreadWorkerGlobalScope, MessageEvents } from '@kit.ArkTS';
import { sharedCGateway } from '../share/SharedC';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const cmd: string = e.data as string;
  if (cmd === 'bind') {
    workerPort.postMessage('bound');
  } else {
    workerPort.postMessage(sharedCGateway.readDThroughC());
  }
};
