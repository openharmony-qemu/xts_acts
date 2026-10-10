import {
  ErrorEvent,
  MessageEvents,
  ThreadWorkerGlobalScope,
  worker,
  ArrayList,
  HashMap,
  HashSet,
  TreeSet,
  LinkedList,
  List,
  Priority
} from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;


workerPort.onmessage = (e: MessageEvents) => {
  const data: object = e.data;

  if (data instanceof ArrayList) {
    const arrayList = data as ArrayList<number>;
    arrayList.add(100);
    arrayList.remove(2);
    workerPort.postMessage(arrayList);
    workerPort.postMessageWithSharedSendable(arrayList);
    workerPort.postMessageAtFront?.(arrayList, Priority.IMMEDIATE);
  } else if (data instanceof HashMap) {
    const hashMap = data as HashMap<string, number>;
    hashMap.set('workerKey', 999);
    hashMap.remove('a');
    workerPort.postMessage(hashMap);
    workerPort.postMessageWithSharedSendable(hashMap);
    workerPort.postMessageAtFront?.(hashMap, Priority.IMMEDIATE);
  } else if (data instanceof TreeSet) {
    const treeSet = data as TreeSet<number>;
    treeSet.remove(1);
    treeSet.clear();
    treeSet.add(100);
    treeSet.add(0);
    treeSet.add(2);
    workerPort.postMessage(treeSet);
    workerPort.postMessageWithSharedSendable(treeSet);
    workerPort.postMessageAtFront?.(treeSet, Priority.IMMEDIATE);
  } else if (data instanceof LinkedList) {
    const linkedList = data as LinkedList<number>;
    linkedList.add(100);
    linkedList.remove(2);
    workerPort.postMessage(linkedList);
    workerPort.postMessageWithSharedSendable(linkedList);
    workerPort.postMessageAtFront?.(linkedList, Priority.IMMEDIATE);
  } else if (data instanceof List) {
    const list = data as List<number>;
    list.add(10);
    list.add(20);
    list.add(30);
    workerPort.postMessage(list);
    workerPort.postMessageWithSharedSendable(list);
    workerPort.postMessageAtFront?.(list, Priority.IMMEDIATE);
  } else if (data instanceof HashSet) {
    const hashSet = data as HashSet<number>;
    hashSet.add(1);
    hashSet.add(2);
    hashSet.add(3);
    workerPort.postMessage(hashSet);
    workerPort.postMessageWithSharedSendable(hashSet);
    workerPort.postMessageAtFront?.(hashSet, Priority.IMMEDIATE);
  }

};

workerPort.onerror = (e: ErrorEvent) => {
  console.error('ContainerLifecycleWorker error:', e.message);
};