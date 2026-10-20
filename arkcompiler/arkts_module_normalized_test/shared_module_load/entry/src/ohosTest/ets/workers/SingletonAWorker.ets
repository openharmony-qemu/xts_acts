// Worker entry: state-consistency suite (worker participant of the official
// SingletonA example). On receiving a round count: loops "increase + read" and
// posts back the last observed value (for range assertions on the main thread)
import { worker, ThreadWorkerGlobalScope, MessageEvents } from '@kit.ArkTS';
import { singletonA } from '../share/SingletonA';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const rounds: number = e.data as number;
  let observed: number = 0;
  const run = async (): Promise<void> => {
    for (let i = 0; i < rounds; i++) {
      await singletonA.increaseCount();
      observed = await singletonA.getCount();
    }
  };
  run().then(() => {
    workerPort.postMessage(observed);
  });
};
