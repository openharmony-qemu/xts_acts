/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { util } from '@kit.ArkTS';
import { JSON } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import worker, { MessageEvents, ErrorEvent } from '@ohos.worker';
import testNapi, { createTestRef, deleteTestRef, createWeakTestRef, deleteWeakTestRef } from 'libentry.so';
import { hidebug } from '@kit.PerformanceAnalysisKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const FILES_DIR = '/data/storage/el2/base/files/';
const SNAPSHOT_PREFIX = 'track_global_ref_';

interface ParsedSnapshot {
  nodes: number[];
  edges: number[];
  strings: string[];
  nodeFieldCount: number;
  edgeFieldCount: number;
  typeFieldIndex: number;
  nameFieldIndex: number;
  idFieldIndex: number;
  selfSizeFieldIndex: number;
  edgeCountFieldIndex: number;
  edgeToNodeIndex: number;
  nodeTypeNames: string[];
}

interface GlobalHandleObjectResult {
  found: boolean;
  edgeCount: number;
  childNames: string[];
}

interface NodeInfo {
  index: number;
  type: string;
  name: string;
  id: number;
  selfSize: number;
  edgeCount: number;
  edgeOffset: number;
}

interface GlobalHandleObjectDetail {
  found: boolean;
  nodeInfo: NodeInfo | null;
  childTypes: string[];
  childNames: string[];
  childSelfSizes: number[];
  childTargetTypes: string[][];
}

class TrackRefTestObject {
  public id: number;
  public name: string;
  public data: string;
  public value: number;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
    this.data = `track_data_${id}`;
    this.value = id * 100;
  }

  getDescription(): string {
    return `${this.name}_${this.id}_${this.value}`;
  }
}

interface HeapVerifyResult {
  heapResult: GlobalHandleObjectResult;
  objectFound: boolean;
}

function useObject(obj: TrackRefTestObject): void {
  console.info(`useObject: id=${obj.id}, name=${obj.name}, data=${obj.data}, value=${obj.value}, desc=${obj.getDescription()}`);
}

function verifyObjectInSnapshot(snapshot: ParsedSnapshot, objectName: string): boolean {
  return snapshot.strings.indexOf(objectName) !== -1;
}

function dumpAndVerifySnapshot(heapFileName: string, objectName: string): HeapVerifyResult {
  hidebug.dumpJsHeapData(heapFileName, false);
  const heapPath: string = FILES_DIR + heapFileName + '.heapsnapshot';
  let content: string = '';
  try {
    content = fs.readTextSync(heapPath);
  } catch (e) {
    console.error(`dumpAndVerifySnapshot: readTextSync failed: ${heapPath}`);
    return { heapResult: { found: false, edgeCount: 0, childNames: [] }, objectFound: false };
  }
  try { fs.unlinkSync(heapPath); } catch (e) { }
  if (!content.includes('"GlobalHandleObject')) {
    return { heapResult: { found: false, edgeCount: 0, childNames: [] }, objectFound: false };
  }
  const snapshot: ParsedSnapshot = parseHeapSnapshot(content);
  const heapResult: GlobalHandleObjectResult = findGlobalHandleObject(snapshot);
  const objectFound: boolean = verifyObjectInSnapshot(snapshot, objectName);
  console.info(`dumpAndVerifySnapshot: object '${objectName}' found in snapshot: ${objectFound}`);
  return { heapResult: heapResult, objectFound: objectFound };
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

const WORKER_WAIT_TIMEOUT_MS = 5000;

let g_activeWorkers: worker.ThreadWorker[] = [];

interface TerminationFlag { done: boolean; }

function registerWorker(w: worker.ThreadWorker): void {
  g_activeWorkers.push(w);
}

function unregisterWorker(w: worker.ThreadWorker): void {
  const idx = g_activeWorkers.indexOf(w);
  if (idx >= 0) {
    g_activeWorkers.splice(idx, 1);
  }
}

function forceTerminateWorkers(): void {
  for (const w of g_activeWorkers) {
    try { w.terminate(); } catch (e) { }
  }
  g_activeWorkers.length = 0;
}

async function awaitWorkerTerminated(flag: TerminationFlag, timeoutMs: number = WORKER_WAIT_TIMEOUT_MS): Promise<boolean> {
  const start: number = Date.now();
  while (!flag.done) {
    if (Date.now() - start >= timeoutMs) {
      return false;
    }
    await sleep(100);
  }
  return true;
}

function parseHeapSnapshot(content: string): ParsedSnapshot {
  const data: Record<string, Object> = JSON.parse(content) as Record<string, Object>;
  const snapshotObj: Record<string, Object> = data['snapshot'] as Record<string, Object>;
  const metaObj: Record<string, Object> = snapshotObj['meta'] as Record<string, Object>;
  const nodeFields: string[] = metaObj['node_fields'] as string[];
  const edgeFields: string[] = metaObj['edge_fields'] as string[];
  const nodeTypesRaw: Object[] = metaObj['node_types'] as Object[];
  const typeNames: string[] = (nodeTypesRaw.length > 0 ? nodeTypesRaw[0] as string[] : []);
  return {
    nodes: data['nodes'] as number[],
    edges: data['edges'] as number[],
    strings: data['strings'] as string[],
    nodeFieldCount: nodeFields.length,
    edgeFieldCount: edgeFields.length,
    typeFieldIndex: nodeFields.indexOf('type'),
    nameFieldIndex: nodeFields.indexOf('name'),
    idFieldIndex: nodeFields.indexOf('id'),
    selfSizeFieldIndex: nodeFields.indexOf('self_size'),
    edgeCountFieldIndex: nodeFields.indexOf('edge_count'),
    edgeToNodeIndex: edgeFields.indexOf('to_node'),
    nodeTypeNames: typeNames
  };
}

function findGlobalHandleObject(snapshot: ParsedSnapshot): GlobalHandleObjectResult {
  let edgeOffset: number = 0;
  let fallback: GlobalHandleObjectResult = { found: false, edgeCount: 0, childNames: [] };

  for (let i = 0; i < snapshot.nodes.length; i += snapshot.nodeFieldCount) {
    const nameIdx: number = snapshot.nodes[i + snapshot.nameFieldIndex];
    const edgeCount: number = snapshot.nodes[i + snapshot.edgeCountFieldIndex];

    if (nameIdx >= 0 && nameIdx < snapshot.strings.length &&
        snapshot.strings[nameIdx].startsWith('GlobalHandleObject')) {
      const childNames: string[] = [];
      for (let j = 0; j < edgeCount; j++) {
        const eIdx: number = (edgeOffset + j) * snapshot.edgeFieldCount;
        const toNodeOffset: number = snapshot.edges[eIdx + snapshot.edgeToNodeIndex];
        const childNameIdx: number = snapshot.nodes[toNodeOffset + snapshot.nameFieldIndex];
        childNames.push(snapshot.strings[childNameIdx]);
      }
      if (edgeCount > 0) {
        return { found: true, edgeCount: edgeCount, childNames: childNames };
      }
      fallback = { found: true, edgeCount: edgeCount, childNames: childNames };
    }

    edgeOffset += edgeCount;
  }

  return fallback;
}

function dumpAndCheckHeap(heapFileName: string): GlobalHandleObjectResult {
  hidebug.dumpJsHeapData(heapFileName, false);
  const heapPath: string = FILES_DIR + heapFileName + '.heapsnapshot';
  let content: string = '';
  try {
    content = fs.readTextSync(heapPath);
  } catch (e) {
    console.error(`dumpAndCheckHeap: readTextSync failed: ${heapPath}`);
    return { found: false, edgeCount: 0, childNames: [] };
  }
  try { fs.unlinkSync(heapPath); } catch (e) { }
  if (!content.includes('"GlobalHandleObject')) {
    return { found: false, edgeCount: 0, childNames: [] };
  }
  const snapshot: ParsedSnapshot = parseHeapSnapshot(content);
  return findGlobalHandleObject(snapshot);
}

function getTypeName(snapshot: ParsedSnapshot, typeIdx: number): string {
  if (snapshot.nodeTypeNames.length > typeIdx && typeIdx >= 0) {
    return snapshot.nodeTypeNames[typeIdx];
  }
  if (typeIdx >= 0 && typeIdx < snapshot.strings.length) {
    return snapshot.strings[typeIdx];
  }
  return 'unknown';
}

function getNodeInfo(snapshot: ParsedSnapshot, nodeIndex: number, edgeOffset: number): NodeInfo {
  const typeIdx: number = snapshot.nodes[nodeIndex + snapshot.typeFieldIndex];
  const nameIdx: number = snapshot.nodes[nodeIndex + snapshot.nameFieldIndex];
  const id: number = snapshot.nodes[nodeIndex + snapshot.idFieldIndex];
  const selfSize: number = snapshot.nodes[nodeIndex + snapshot.selfSizeFieldIndex];
  const edgeCount: number = snapshot.nodes[nodeIndex + snapshot.edgeCountFieldIndex];
  const name: string = (nameIdx >= 0 && nameIdx < snapshot.strings.length) ? snapshot.strings[nameIdx] : '';
  return {
    index: nodeIndex,
    type: getTypeName(snapshot, typeIdx),
    name: name,
    id: id,
    selfSize: selfSize,
    edgeCount: edgeCount,
    edgeOffset: edgeOffset
  };
}

function calculateEdgeOffset(snapshot: ParsedSnapshot, targetNodeIndex: number): number {
  let offset: number = 0;
  for (let i = 0; i < targetNodeIndex; i += snapshot.nodeFieldCount) {
    offset += snapshot.nodes[i + snapshot.edgeCountFieldIndex];
  }
  return offset;
}

function getGlobalHandleObjectDetail(snapshot: ParsedSnapshot): GlobalHandleObjectDetail {
  let edgeOffset: number = 0;
  let fallback: GlobalHandleObjectDetail = { found: false, nodeInfo: null, childTypes: [], childNames: [], childSelfSizes: [], childTargetTypes: [] };

  for (let i = 0; i < snapshot.nodes.length; i += snapshot.nodeFieldCount) {
    const nameIdx: number = snapshot.nodes[i + snapshot.nameFieldIndex];
    const edgeCount: number = snapshot.nodes[i + snapshot.edgeCountFieldIndex];

    if (nameIdx >= 0 && nameIdx < snapshot.strings.length &&
        snapshot.strings[nameIdx].startsWith('GlobalHandleObject')) {
      const info: NodeInfo = getNodeInfo(snapshot, i, edgeOffset);
      const childTypes: string[] = [];
      const childNames: string[] = [];
      const childSelfSizes: number[] = [];
      const childTargetTypes: string[][] = [];

      for (let j = 0; j < edgeCount; j++) {
        const eIdx: number = (edgeOffset + j) * snapshot.edgeFieldCount;
        const toNodeOffset: number = snapshot.edges[eIdx + snapshot.edgeToNodeIndex];
        const childInfo: NodeInfo = getNodeInfo(snapshot, toNodeOffset, 0);
        childTypes.push(childInfo.type);
        childNames.push(childInfo.name);
        childSelfSizes.push(childInfo.selfSize);

        const childEdgeOffset: number = calculateEdgeOffset(snapshot, toNodeOffset);
        const childEdgeCount: number = snapshot.nodes[toNodeOffset + snapshot.edgeCountFieldIndex];
        const targetTypes: string[] = [];
        for (let k = 0; k < childEdgeCount; k++) {
          const childEIdx: number = (childEdgeOffset + k) * snapshot.edgeFieldCount;
          const childToNode: number = snapshot.edges[childEIdx + snapshot.edgeToNodeIndex];
          const childToTypeIdx: number = snapshot.nodes[childToNode + snapshot.typeFieldIndex];
          targetTypes.push(getTypeName(snapshot, childToTypeIdx));
        }
        childTargetTypes.push(targetTypes);
      }

      if (edgeCount > 0) {
        return { found: true, nodeInfo: info, childTypes: childTypes, childNames: childNames, childSelfSizes: childSelfSizes, childTargetTypes: childTargetTypes };
      }
      fallback = { found: true, nodeInfo: info, childTypes: childTypes, childNames: childNames, childSelfSizes: childSelfSizes, childTargetTypes: childTargetTypes };
    }

    edgeOffset += edgeCount;
  }

  return fallback;
}

function dumpAndGetSnapshot(heapFileName: string): ParsedSnapshot {
  hidebug.dumpJsHeapData(heapFileName, false);
  const heapPath: string = FILES_DIR + heapFileName + '.heapsnapshot';
  let content: string = '';
  try {
    content = fs.readTextSync(heapPath);
  } catch (e) {
    console.error(`dumpAndGetSnapshot: readTextSync failed: ${heapPath}`);
    return { nodes: [], edges: [], strings: [], nodeFieldCount: 0, edgeFieldCount: 0, typeFieldIndex: 0, nameFieldIndex: 0, idFieldIndex: 0, selfSizeFieldIndex: 0, edgeCountFieldIndex: 0, edgeToNodeIndex: 0, nodeTypeNames: [] };
  }
  try { fs.unlinkSync(heapPath); } catch (e) { }
  return parseHeapSnapshot(content);
}

function cleanupHeapSnapshots(): void {
  try {
    let files: string[] = fs.listFileSync(FILES_DIR);
    for (let i = 0; i < files.length; i++) {
      if (files[i].startsWith(SNAPSHOT_PREFIX)) {
        fs.unlinkSync(FILES_DIR + files[i]);
      }
    }
  } catch (e) {
  }
}

export default function trackGlobalRefTest() {

  describe('trackGlobalRefTest', () => {

    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(50);
      try { forceTerminateWorkers(); } catch (e) { }
      try { deleteTestRef(); } catch (e) { }
      try { deleteWeakTestRef(); } catch (e) { }
      try { testNapi.clearNapiRefs(); } catch (e) { }
      try { cleanupHeapSnapshots(); } catch (e) { }
    })

    afterEach(() => {
      try { forceTerminateWorkers(); } catch (e) { }
      try { deleteTestRef(); } catch (e) { }
      try { deleteWeakTestRef(); } catch (e) { }
      try { testNapi.clearNapiRefs(); } catch (e) { }
      try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
      try { cleanupHeapSnapshots(); } catch (e) { }
    })

    afterAll(() => {
    })

    /**
     * @tc.name   testSetTrackGlobalRefEnable001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0100
     * @tc.desc   Enable tracking with setTrackGlobalRef(true), verify no exception thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefEnable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefEnable001';
      console.info(`${TAG} START`);
      let callCompleted = false;
      try {
        util.ArkTSVM.setTrackGlobalRef(true);
        console.info(`${TAG} setTrackGlobalRef(true) succeeded`);
        callCompleted = true;
        expect(callCompleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDisable001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0200
     * @tc.desc   Disable tracking with setTrackGlobalRef(false), verify no exception thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefDisable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDisable001';
      console.info(`${TAG} START`);
      let callCompleted = false;
      try {
        util.ArkTSVM.setTrackGlobalRef(false);
        console.info(`${TAG} setTrackGlobalRef(false) succeeded`);
        callCompleted = true;
        expect(callCompleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefCycle001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0300
     * @tc.desc   Test enable-then-disable cycle, verify no exception thrown at each step.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefCycle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefCycle001';
      console.info(`${TAG} START`);
      let callCompleted = false;
      try {
        util.ArkTSVM.setTrackGlobalRef(true);
        console.info(`${TAG} setTrackGlobalRef(true) succeeded`);
        util.ArkTSVM.setTrackGlobalRef(false);
        console.info(`${TAG} setTrackGlobalRef(false) succeeded`);
        util.ArkTSVM.setTrackGlobalRef(true);
        console.info(`${TAG} setTrackGlobalRef(true) second time succeeded`);
        callCompleted = true;
        expect(callCompleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefRepeatEnable001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0400
     * @tc.desc   Test calling setTrackGlobalRef(true) multiple times, verify no exception thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefRepeatEnable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefRepeatEnable001';
      console.info(`${TAG} START`);
      let callCompleted = false;
      try {
        util.ArkTSVM.setTrackGlobalRef(true);
        util.ArkTSVM.setTrackGlobalRef(true);
        util.ArkTSVM.setTrackGlobalRef(true);
        console.info(`${TAG} multiple setTrackGlobalRef(true) calls succeeded`);
        callCompleted = true;
        expect(callCompleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDisableNoPrior001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0500
     * @tc.desc   Test calling setTrackGlobalRef(false) without prior enable, verify no exception thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefDisableNoPrior001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDisableNoPrior001';
      console.info(`${TAG} START`);
      let callCompleted = false;
      try {
        util.ArkTSVM.setTrackGlobalRef(false);
        console.info(`${TAG} setTrackGlobalRef(false) without prior enable succeeded`);
        callCompleted = true;
        expect(callCompleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefRepeatDisable001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0600
     * @tc.desc   Test calling setTrackGlobalRef(false) multiple times, verify no exception thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefRepeatDisable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefRepeatDisable001';
      console.info(`${TAG} START`);
      let callCompleted = false;
      try {
        util.ArkTSVM.setTrackGlobalRef(false);
        util.ArkTSVM.setTrackGlobalRef(false);
        util.ArkTSVM.setTrackGlobalRef(false);
        console.info(`${TAG} multiple setTrackGlobalRef(false) calls succeeded`);
        callCompleted = true;
        expect(callCompleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDumpDisabled001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0700
     * @tc.desc   Without enabling setTrackGlobalRef, dump heap has no GlobalHandleObject nodes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefDumpDisabled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDumpDisabled001';
      const OBJ_NAME = 'TrackRefObj_0700';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(false);
        let obj: TrackRefTestObject = new TrackRefTestObject(700, OBJ_NAME);
        useObject(obj);
        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}07`);
        expect(heapResult.found).assertFalse();
        console.info(`${TAG} heap snapshot has no GlobalHandleObject: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDumpEnabledNoRef001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0800
      * @tc.desc   After enabling setTrackGlobalRef(true), heap has GlobalHandleObject with 0 children.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefDumpEnabledNoRef001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDumpEnabledNoRef001';
      const OBJ_NAME = 'TrackRefObj_0800';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        testNapi.clearNapiRefs();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(800, OBJ_NAME);
        useObject(obj);
        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}08`);
        expect(heapResult.found).assertTrue();
        expect(heapResult.edgeCount).assertEqual(0);
        console.info(`${TAG} GlobalHandleObject with 0 children: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDumpEnabledWithRef001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_0900
     * @tc.desc   After creating napi_ref with tracking enabled, dump has GlobalHandleObject with child nodes containing the ref address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefDumpEnabledWithRef001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDumpEnabledWithRef001';
      const OBJ_NAME = 'TrackRefObj_0900';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(900, OBJ_NAME);
        const refAddr: string = createTestRef(obj);
        useObject(obj);
        console.info(`${TAG} created napi_ref, address: ${refAddr}`);

        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}09`);
        expect(heapResult.found).assertTrue();
        expect(heapResult.edgeCount).assertLarger(0);

        let addrFound: boolean = false;
        let prefixFound: boolean = false;
        for (const childName of heapResult.childNames) {
          if (childName.indexOf(refAddr) !== -1) {
            addrFound = true;
          }
          if (childName.indexOf('ReferenceAddress:0x') !== -1) {
            prefixFound = true;
          }
        }
        expect(addrFound).assertTrue();
        expect(prefixFound).assertTrue();
        console.info(`${TAG} ref address ${refAddr} found: ${addrFound}, ReferenceAddress prefix found: ${prefixFound}: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDumpAfterDisable001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1000
     * @tc.desc   After disabling setTrackGlobalRef(false), dump heap has no GlobalHandleObject nodes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefDumpAfterDisable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDumpAfterDisable001';
      const OBJ_NAME = 'TrackRefObj_1000';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(1000, OBJ_NAME);
        const refAddr: string = createTestRef(obj);
        useObject(obj);

        util.ArkTSVM.setTrackGlobalRef(false);
        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}10`);
        if (heapResult.found) {
          let addrFound: boolean = false;
          for (const childName of heapResult.childNames) {
            if (childName.indexOf(refAddr) !== -1) {
              addrFound = true;
              break;
            }
          }
          expect(addrFound).assertFalse();
          console.info(`${TAG} GHO persists but ref ${refAddr} not tracked after disable: PASS`);
        } else {
          expect(heapResult.found).assertFalse();
          console.info(`${TAG} GHO destroyed after disable: PASS`);
        }
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefCleanupReEnable001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1100
     * @tc.desc   After disable then re-enable, old ref address is cleaned up and new ref is tracked.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefCleanupReEnable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefCleanupReEnable001';
      const OBJ_NAME_A = 'TrackRefObj_1100A';
      const OBJ_NAME_B = 'TrackRefObj_1100B';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let objA: TrackRefTestObject = new TrackRefTestObject(1100, OBJ_NAME_A);
        const refAddrA: string = createTestRef(objA);
        useObject(objA);
        console.info(`${TAG} phase1: created ref A, address: ${refAddrA}`);

        util.ArkTSVM.setTrackGlobalRef(false);
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);

        let objB: TrackRefTestObject = new TrackRefTestObject(1101, OBJ_NAME_B);
        const refAddrB: string = createTestRef(objB);
        useObject(objB);
        console.info(`${TAG} phase3: created ref B, address: ${refAddrB}`);

        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}11`);
        expect(heapResult.found).assertTrue();
        expect(heapResult.edgeCount).assertLarger(0);

        let addrBFound: boolean = false;
        let prefixFound: boolean = false;
        for (const childName of heapResult.childNames) {
          if (childName.indexOf(refAddrB) !== -1) {
            addrBFound = true;
          }
          if (childName.indexOf('ReferenceAddress:0x') !== -1) {
            prefixFound = true;
          }
        }
        expect(addrBFound).assertTrue();
        expect(prefixFound).assertTrue();
        console.info(`${TAG} ref B found: ${addrBFound}, ReferenceAddress prefix found: ${prefixFound}: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefCreateAfterEnable001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1200
     * @tc.desc   After enabling tracking, creating napi_ref increases GlobalHandleObject edge count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefCreateAfterEnable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefCreateAfterEnable001';
      const OBJ_NAME = 'TrackRefObj_1200';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(1200, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        const verifyResult: HeapVerifyResult = dumpAndVerifySnapshot(`${SNAPSHOT_PREFIX}12`, OBJ_NAME);
        expect(verifyResult.objectFound).assertTrue();
        expect(verifyResult.heapResult.found).assertTrue();
        expect(verifyResult.heapResult.edgeCount).assertLarger(0);
        console.info(`${TAG} edgeCount after create: ${verifyResult.heapResult.edgeCount}`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDeleteAfterEnable001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1300
     * @tc.desc   After deleting napi_ref with tracking enabled, dump heap and verify GlobalHandleObject state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefDeleteAfterEnable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDeleteAfterEnable001';
      const OBJ_NAME = 'TrackRefObj_1300';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(1300, OBJ_NAME);
        const refAddr: string = createTestRef(obj);
        useObject(obj);
        const heapResultBefore: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}13a`);
        expect(heapResultBefore.found).assertTrue();
        expect(heapResultBefore.edgeCount).assertLarger(0);
        console.info(`${TAG} before delete: edgeCount=${heapResultBefore.edgeCount}`);

        deleteTestRef();
        const heapResultAfter: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}13b`);
        if (heapResultAfter.found) {
          let addrFound: boolean = false;
          for (const childName of heapResultAfter.childNames) {
            if (childName.indexOf(refAddr) !== -1) {
              addrFound = true;
              break;
            }
          }
          expect(addrFound).assertFalse();
          console.info(`${TAG} GHO persists but ref ${refAddr} removed after delete: PASS`);
        } else {
          expect(heapResultAfter.found).assertFalse();
          console.info(`${TAG} GHO destroyed after delete ref: PASS`);
        }
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefMultipleRefs001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1400
     * @tc.desc   After enabling tracking and creating multiple napi_refs, edge count is proportional to ref count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefMultipleRefs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefMultipleRefs001';
      console.info(`${TAG} START`);
      const REF_COUNT = 50;
      try {
        testNapi.clearNapiRefs();
        util.ArkTSVM.setTrackGlobalRef(true);
        let created: boolean = testNapi.createNapiRefs(REF_COUNT, 1);
        expect(created).assertTrue();
        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}14`);
        expect(heapResult.found).assertTrue();
        expect(heapResult.edgeCount).assertLarger(0);
        console.info(`${TAG} edgeCount: ${heapResult.edgeCount} > 0 (50 refs created)`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        testNapi.clearNapiRefs();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefEnableAfterRef001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1500
     * @tc.desc   Refs created before enabling tracking are NOT tracked (StoreGlobalRefMapping is no-op when tracking off).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefEnableAfterRef001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefEnableAfterRef001';
      const OBJ_NAME = 'TrackRefObj_1500';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        let obj: TrackRefTestObject = new TrackRefTestObject(1500, OBJ_NAME);
        const refAddr: string = createTestRef(obj);
        useObject(obj);
        console.info(`${TAG} created ref before enabling tracking, address: ${refAddr}`);

        util.ArkTSVM.setTrackGlobalRef(true);
        const verifyResult: HeapVerifyResult = dumpAndVerifySnapshot(`${SNAPSHOT_PREFIX}15`, OBJ_NAME);
        expect(verifyResult.objectFound).assertTrue();
        expect(verifyResult.heapResult.found).assertTrue();

        let addrFound: boolean = false;
        for (const childName of verifyResult.heapResult.childNames) {
          if (childName.indexOf(refAddr) !== -1) {
            addrFound = true;
            break;
          }
        }
        expect(addrFound).assertFalse();
        console.info(`${TAG} ref created before enable NOT tracked (StoreGlobalRefMapping no-op when tracking off): PASS, edgeCount: ${verifyResult.heapResult.edgeCount}`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDynamicRefChange001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1600
     * @tc.desc   With tracking enabled, dynamically increase and decrease napi_refs, verify edge count trend.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefDynamicRefChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDynamicRefChange001';
      console.info(`${TAG} START`);
      const REF_BATCH = 10;
      try {
        testNapi.clearNapiRefs();
        util.ArkTSVM.setTrackGlobalRef(true);

        testNapi.createNapiRefs(REF_BATCH, 1);
        testNapi.createNapiRefs(REF_BATCH, 1);
        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}16`);
        console.info(`${TAG} after add 2 batches: edgeCount=${heapResult.edgeCount}`);
        expect(heapResult.edgeCount).assertLarger(0);

        testNapi.deleteNapiRefs(REF_BATCH);
        console.info(`${TAG} deleted one batch, remaining refs tracked: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        testNapi.clearNapiRefs();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefMainThread001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1700
     * @tc.desc   Main thread sets setTrackGlobalRef(true), verify heap snapshot on main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefMainThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefMainThread001';
      const OBJ_NAME = 'TrackRefObj_1700';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(1700, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        const verifyResult: HeapVerifyResult = dumpAndVerifySnapshot(`${SNAPSHOT_PREFIX}17`, OBJ_NAME);
        expect(verifyResult.objectFound).assertTrue();
        expect(verifyResult.heapResult.found).assertTrue();
        console.info(`${TAG} main thread heap has GlobalHandleObject: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefWorkerAffectsMain001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1800
     * @tc.desc   Worker thread sets setTrackGlobalRef(true), verify main thread heap snapshot has GlobalHandleObject.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefWorkerAffectsMain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testSetTrackGlobalRefWorkerAffectsMain001';
      const OBJ_NAME = 'TrackRefObj_1800';
      console.info(`${TAG} START`);
      const termFlag: TerminationFlag = { done: false };
      let newWorker: worker.ThreadWorker;
      try {
        newWorker = new worker.ThreadWorker('./TrackGlobalRefWorker.ets');
        registerWorker(newWorker);
        newWorker.onexit = () => {
          termFlag.done = true;
          unregisterWorker(newWorker);
        };
        newWorker.onerror = (err: ErrorEvent) => {
          console.error(`${TAG} worker error: ${err.message}`);
          termFlag.done = true;
          expect().assertFail();
          try { newWorker.terminate(); } catch (e) { }
          unregisterWorker(newWorker);
        };
        newWorker.onmessage = (e: MessageEvents): void => {
          let result: string = e.data as string;
          console.info(`${TAG} worker response: ${result}`);
          if (result === 'enabled') {
            try {
              let obj: TrackRefTestObject = new TrackRefTestObject(1800, OBJ_NAME);
              useObject(obj);
              const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}18`);
              expect(heapResult.found).assertTrue();
              console.info(`${TAG} main thread heap has GlobalHandleObject after worker enabled: PASS`);
            } catch (err) {
              console.error(`${TAG} heap check failed, error code: ${(err as BusinessError).code}`);
              expect().assertFail();
            }
            try { newWorker.postMessage('disable'); } catch (e) { }
          } else if (result === 'disabled') {
            try { newWorker.terminate(); } catch (e) { }
          } else {
            expect().assertFail();
          }
        };
        newWorker.postMessage('enable');
      } catch (err) {
        console.error(`${TAG} worker setup failed: ${(err as BusinessError).message}`);
        expect().assertFail();
        forceTerminateWorkers();
        done();
        return;
      }
      const terminated: boolean = await awaitWorkerTerminated(termFlag);
      if (!terminated) {
        console.error(`${TAG} worker not terminated within timeout, force terminating`);
        try { newWorker.terminate(); } catch (e) { }
        unregisterWorker(newWorker);
      }
      expect(terminated).assertTrue();
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefMainAffectsWorker001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_1900
     * @tc.desc   Main thread enables tracking, worker thread calls setTrackGlobalRef, verify no crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefMainAffectsWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testSetTrackGlobalRefMainAffectsWorker001';
      console.info(`${TAG} START`);
      util.ArkTSVM.setTrackGlobalRef(true);
      const termFlag: TerminationFlag = { done: false };
      let newWorker: worker.ThreadWorker;
      try {
        newWorker = new worker.ThreadWorker('./TrackGlobalRefWorker.ets');
        registerWorker(newWorker);
        newWorker.onexit = () => {
          termFlag.done = true;
          unregisterWorker(newWorker);
        };
        newWorker.onerror = (err: ErrorEvent) => {
          console.error(`${TAG} worker error: ${err.message}`);
          termFlag.done = true;
          expect().assertFail();
          try { newWorker.terminate(); } catch (e) { }
          unregisterWorker(newWorker);
        };
        newWorker.onmessage = (e: MessageEvents): void => {
          console.info(`${TAG} worker response: ${e.data}`);
          try { newWorker.terminate(); } catch (e) { }
        };
        newWorker.postMessage('disable');
      } catch (err) {
        console.error(`${TAG} worker setup failed: ${(err as BusinessError).message}`);
        expect().assertFail();
        forceTerminateWorkers();
        done();
        return;
      }
      try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
      const terminated: boolean = await awaitWorkerTerminated(termFlag);
      if (!terminated) {
        console.error(`${TAG} worker not terminated within timeout, force terminating`);
        try { newWorker.terminate(); } catch (e) { }
        unregisterWorker(newWorker);
      }
      console.info(`${TAG} worker called setTrackGlobalRef, terminated within timeout: ${terminated}`);
      expect(terminated).assertTrue();
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefConcurrentSafety001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_2000
     * @tc.desc   Main thread and worker thread concurrently call setTrackGlobalRef, verify no crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefConcurrentSafety001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testSetTrackGlobalRefConcurrentSafety001';
      console.info(`${TAG} START`);
      const termFlag: TerminationFlag = { done: false };
      let newWorker: worker.ThreadWorker;
      try {
        newWorker = new worker.ThreadWorker('./TrackGlobalRefWorker.ets');
        registerWorker(newWorker);
        newWorker.onexit = () => {
          termFlag.done = true;
          unregisterWorker(newWorker);
        };
        newWorker.onerror = (err: ErrorEvent) => {
          console.error(`${TAG} worker error: ${err.message}`);
          termFlag.done = true;
          expect().assertFail();
          try { newWorker.terminate(); } catch (e) { }
          unregisterWorker(newWorker);
        };
        newWorker.onmessage = (e: MessageEvents): void => {
          let result: string = e.data as string;
          console.info(`${TAG} worker concurrent result: ${result}`);
          expect(result === 'concurrentDone').assertTrue();
          try { newWorker.terminate(); } catch (e) { }
        };
        newWorker.postMessage('concurrentToggle');
      } catch (err) {
        console.error(`${TAG} worker setup failed: ${(err as BusinessError).message}`);
        expect().assertFail();
        forceTerminateWorkers();
        done();
        return;
      }
      let toggleCompleted = false;
      try {
        for (let i = 0; i < 50; i++) {
          util.ArkTSVM.setTrackGlobalRef(true);
          util.ArkTSVM.setTrackGlobalRef(false);
        }
        console.info(`${TAG} main thread concurrent toggle completed`);
        toggleCompleted = true;
        expect(toggleCompleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} main thread failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      const terminated: boolean = await awaitWorkerTerminated(termFlag);
      if (!terminated) {
        console.error(`${TAG} worker not terminated within timeout, force terminating`);
        try { newWorker.terminate(); } catch (e) { }
        unregisterWorker(newWorker);
      }
      expect(terminated).assertTrue();
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefRapidToggle001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_2400
     * @tc.desc   Rapidly toggle setTrackGlobalRef true/false 100 times, verify no crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefRapidToggle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefRapidToggle001';
      console.info(`${TAG} START`);
      const TOGGLE_TIMES = 100;
      let completedToggles = 0;
      try {
        for (let i = 0; i < TOGGLE_TIMES; i++) {
          util.ArkTSVM.setTrackGlobalRef(true);
          util.ArkTSVM.setTrackGlobalRef(false);
          completedToggles++;
        }
        console.info(`${TAG} ${TOGGLE_TIMES} rapid toggles completed without exception`);
        expect(completedToggles).assertEqual(TOGGLE_TIMES);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefLargeBatchRef001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_2500
     * @tc.desc   With tracking enabled, create 1000 napi_refs, verify edge count >= 1000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefLargeBatchRef001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefLargeBatchRef001';
      console.info(`${TAG} START`);
      const BATCH_COUNT = 1000;
      try {
        testNapi.clearNapiRefs();
        util.ArkTSVM.setTrackGlobalRef(true);
        let created: boolean = testNapi.createNapiRefs(BATCH_COUNT, 1);
        expect(created).assertTrue();
        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}25`);
        expect(heapResult.found).assertTrue();
        expect(heapResult.edgeCount).assertLarger(0);
        console.info(`${TAG} edgeCount: ${heapResult.edgeCount} > 0 (${BATCH_COUNT} refs created)`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        testNapi.clearNapiRefs();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefDumpPerformance001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_2600
     * @tc.desc   With tracking enabled, dump heap snapshot, verify file exists and is non-empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefDumpPerformance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefDumpPerformance001';
      const OBJ_NAME = 'TrackRefObj_2600';
      console.info(`${TAG} START`);
      const SNAPSHOT_NAME = `${SNAPSHOT_PREFIX}26`;
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(2600, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        hidebug.dumpJsHeapData(SNAPSHOT_NAME, false);
        const files: string[] = fs.listFileSync(FILES_DIR);
        let found = false;
        for (let i = 0; i < files.length; i++) {
          if (files[i].startsWith(SNAPSHOT_NAME) && files[i].endsWith('.heapsnapshot')) {
            let heapPath = FILES_DIR + files[i];
            let fileStat = fs.statSync(heapPath);
            console.info(`${TAG} snapshot file: ${files[i]}, size: ${fileStat.size}`);
            expect(fileStat.size > 0).assertTrue();
            let content = fs.readTextSync(heapPath);
            expect(content.length > 0).assertTrue();
            expect(content.includes('"GlobalHandleObject')).assertTrue();
            expect(content.includes(OBJ_NAME)).assertTrue();
            fs.unlinkSync(heapPath);
            console.info(`${TAG} deleted snapshot file: ${files[i]}`);
            found = true;
            break;
          }
        }
        expect(found).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefSnapshotFileExists001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_2700
     * @tc.desc   After dumpJsHeapData, verify snapshot file exists and size > 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefSnapshotFileExists001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefSnapshotFileExists001';
      const OBJ_NAME = 'TrackRefObj_2700';
      console.info(`${TAG} START`);
      const SNAPSHOT_NAME = `${SNAPSHOT_PREFIX}27`;
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(2700, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        hidebug.dumpJsHeapData(SNAPSHOT_NAME, false);
        const files: string[] = fs.listFileSync(FILES_DIR);
        let found = false;
        for (let i = 0; i < files.length; i++) {
          if (files[i].startsWith(SNAPSHOT_NAME) && files[i].endsWith('.heapsnapshot')) {
            let heapPath = FILES_DIR + files[i];
            let fileStat = fs.statSync(heapPath);
            console.info(`${TAG} snapshot file: ${files[i]}, size: ${fileStat.size}`);
            expect(fileStat.size > 0).assertTrue();
            fs.unlinkSync(heapPath);
            console.info(`${TAG} deleted snapshot file: ${files[i]}`);
            found = true;
            break;
          }
        }
        expect(found).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefSnapshotValidJson001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_2800
     * @tc.desc   Read snapshot file, verify it can be parsed as JSON with nodes/edges/strings fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefSnapshotValidJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefSnapshotValidJson001';
      const OBJ_NAME = 'TrackRefObj_2800';
      console.info(`${TAG} START`);
      const SNAPSHOT_NAME = `${SNAPSHOT_PREFIX}28`;
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(2800, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        hidebug.dumpJsHeapData(SNAPSHOT_NAME, false);
        const files: string[] = fs.listFileSync(FILES_DIR);
        let found = false;
        for (let i = 0; i < files.length; i++) {
          if (files[i].startsWith(SNAPSHOT_NAME) && files[i].endsWith('.heapsnapshot')) {
            let heapPath = FILES_DIR + files[i];
            let fileStat = fs.statSync(heapPath);
            console.info(`${TAG} snapshot file: ${files[i]}, size: ${fileStat.size}`);
            expect(fileStat.size > 0).assertTrue();
            let content = fs.readTextSync(heapPath);
            expect(content.includes(OBJ_NAME)).assertTrue();
            console.info(`${TAG} snapshot file valid, size: ${fileStat.size}`);
            fs.unlinkSync(heapPath);
            console.info(`${TAG} deleted snapshot file: ${files[i]}`);
            found = true;
            break;
          }
        }
        expect(found).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefSnapshotCleanup001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_2900
     * @tc.desc   After test, snapshot files are cleaned up, verify no residual files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefSnapshotCleanup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefSnapshotCleanup001';
      const OBJ_NAME = 'TrackRefObj_2900';
      console.info(`${TAG} START`);
      const SNAPSHOT_NAME = `${SNAPSHOT_PREFIX}29`;
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(2900, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        hidebug.dumpJsHeapData(SNAPSHOT_NAME, false);
        const files: string[] = fs.listFileSync(FILES_DIR);
        let found = false;
        let heapPath: string = '';
        for (let i = 0; i < files.length; i++) {
          if (files[i].startsWith(SNAPSHOT_NAME) && files[i].endsWith('.heapsnapshot')) {
            heapPath = FILES_DIR + files[i];
            let fileStat = fs.statSync(heapPath);
            expect(fileStat.size > 0).assertTrue();
            console.info(`${TAG} snapshot created, size: ${fileStat.size}`);
            fs.unlinkSync(heapPath);
            console.info(`${TAG} snapshot deleted`);
            found = true;
            break;
          }
        }
        expect(found).assertTrue();

        let fileExists: boolean = true;
        try {
          fs.statSync(heapPath);
        } catch (e) {
          fileExists = false;
        }
        expect(fileExists).assertFalse();
        console.info(`${TAG} snapshot cleanup verified: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefSnapshotStructure001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3000
     * @tc.desc   Validate heap snapshot structure integrity: nodes/edges divisible by field count, edge count consistency, to_node validity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefSnapshotStructure001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefSnapshotStructure001';
      const OBJ_NAME = 'TrackRefObj_3000';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(3000, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        const snapshot: ParsedSnapshot = dumpAndGetSnapshot(`${SNAPSHOT_PREFIX}30`);
        expect(verifyObjectInSnapshot(snapshot, OBJ_NAME)).assertTrue();
        expect(snapshot.nodes.length % snapshot.nodeFieldCount === 0).assertTrue();
        expect(snapshot.edges.length % snapshot.edgeFieldCount === 0).assertTrue();
        expect(snapshot.nodes.length > 0).assertTrue();
        expect(snapshot.edges.length > 0).assertTrue();
        expect(snapshot.strings.length > 0).assertTrue();
        expect(snapshot.nodeFieldCount > 0).assertTrue();
        expect(snapshot.edgeFieldCount > 0).assertTrue();
        const nodeCount: number = snapshot.nodes.length / snapshot.nodeFieldCount;
        const edgeCount: number = snapshot.edges.length / snapshot.edgeFieldCount;
        console.info(`${TAG} nodeCount=${nodeCount}, edgeCount=${edgeCount}, nodeFieldCount=${snapshot.nodeFieldCount}`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefNodeTypeDiversity001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3100
     * @tc.desc   Verify multiple node types exist in snapshot, including Object and GlobalHandleObject when tracking enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefNodeTypeDiversity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefNodeTypeDiversity001';
      const OBJ_NAME = 'TrackRefObj_3100';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(3100, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        const snapshot: ParsedSnapshot = dumpAndGetSnapshot(`${SNAPSHOT_PREFIX}31`);
        let typeCount: number = 0;
        let hasObject: boolean = false;
        const typeSet: Set<string> = new Set<string>();
        for (let i = 0; i < snapshot.nodes.length; i += snapshot.nodeFieldCount) {
          const typeIdx: number = snapshot.nodes[i + snapshot.typeFieldIndex];
          const typeName: string = getTypeName(snapshot, typeIdx);
          if (!typeSet.has(typeName)) {
            typeSet.add(typeName);
            typeCount++;
            if (typeName === 'object') {
              hasObject = true;
            }
          }
        }
        const ghoResult: GlobalHandleObjectResult = findGlobalHandleObject(snapshot);
        console.info(`${TAG} node types: ${typeCount}`);
        expect(typeCount >= 3).assertTrue();
        expect(hasObject).assertTrue();
        expect(ghoResult.found).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefNodeIdUniqueness001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3200
     * @tc.desc   Verify all node IDs in snapshot are unique, no duplicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefNodeIdUniqueness001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefNodeIdUniqueness001';
      const OBJ_NAME = 'TrackRefObj_3200';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(3200, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        const snapshot: ParsedSnapshot = dumpAndGetSnapshot(`${SNAPSHOT_PREFIX}32`);
        const idSet: Set<number> = new Set<number>();
        let duplicateCount: number = 0;
        let nonZeroIdCount: number = 0;
        for (let i = 0; i < snapshot.nodes.length; i += snapshot.nodeFieldCount) {
          const nodeId: number = snapshot.nodes[i + snapshot.idFieldIndex];
          if (nodeId !== 0) {
            nonZeroIdCount++;
            if (idSet.has(nodeId)) {
              duplicateCount++;
            }
            idSet.add(nodeId);
          }
        }
        console.info(`${TAG} nonZeroIdNodes=${nonZeroIdCount}, uniqueIds=${idSet.size}, duplicates=${duplicateCount}`);
        expect(duplicateCount === 0).assertTrue();
        expect(idSet.size === nonZeroIdCount).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefEdgeValidity001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3300
     * @tc.desc   Verify all edge to_node offsets point to valid positions within nodes array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefEdgeValidity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefEdgeValidity001';
      const OBJ_NAME = 'TrackRefObj_3300';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(3300, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        const snapshot: ParsedSnapshot = dumpAndGetSnapshot(`${SNAPSHOT_PREFIX}33`);
        expect(verifyObjectInSnapshot(snapshot, OBJ_NAME)).assertTrue();
        let edgeOffset: number = 0;
        let invalidEdgeCount: number = 0;
        let totalEdgeCount: number = 0;
        for (let i = 0; i < snapshot.nodes.length; i += snapshot.nodeFieldCount) {
          const ec: number = snapshot.nodes[i + snapshot.edgeCountFieldIndex];
          for (let j = 0; j < ec; j++) {
            const eIdx: number = (edgeOffset + j) * snapshot.edgeFieldCount;
            const toNode: number = snapshot.edges[eIdx + snapshot.edgeToNodeIndex];
            if (toNode < 0 || toNode >= snapshot.nodes.length) {
              invalidEdgeCount++;
            }
            totalEdgeCount++;
          }
          edgeOffset += ec;
        }
        console.info(`${TAG} totalEdges=${totalEdgeCount}, invalidEdges=${invalidEdgeCount}`);
        expect(invalidEdgeCount === 0).assertTrue();
        expect(totalEdgeCount > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefEdgeCountConsistency001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3400
     * @tc.desc   Verify sum of all node edge_count fields equals total edges in edges array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefEdgeCountConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefEdgeCountConsistency001';
      const OBJ_NAME = 'TrackRefObj_3400';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(3400, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);
        const snapshot: ParsedSnapshot = dumpAndGetSnapshot(`${SNAPSHOT_PREFIX}34`);
        expect(verifyObjectInSnapshot(snapshot, OBJ_NAME)).assertTrue();
        let sumEdgeCount: number = 0;
        for (let i = 0; i < snapshot.nodes.length; i += snapshot.nodeFieldCount) {
          sumEdgeCount += snapshot.nodes[i + snapshot.edgeCountFieldIndex];
        }
        const totalEdges: number = snapshot.edges.length / snapshot.edgeFieldCount;
        console.info(`${TAG} sumEdgeCount=${sumEdgeCount}, totalEdges=${totalEdges}`);
        expect(sumEdgeCount === totalEdges).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefGHODetail001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3500
     * @tc.desc   Verify GlobalHandleObject node full structure: type, id, selfSize, edgeCount, child node types and selfSizes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefGHODetail001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefGHODetail001';
      const OBJ_NAME = 'TrackRefObj_3500';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(3500, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);

        const snapshot: ParsedSnapshot = dumpAndGetSnapshot(`${SNAPSHOT_PREFIX}35`);
        const detail: GlobalHandleObjectDetail = getGlobalHandleObjectDetail(snapshot);
        expect(detail.found).assertTrue();
        expect(detail.nodeInfo !== null).assertTrue();
        if (detail.nodeInfo !== null) {
          console.info(`${TAG} GHO node: type=${detail.nodeInfo.type}, id=${detail.nodeInfo.id}, selfSize=${detail.nodeInfo.selfSize}, edgeCount=${detail.nodeInfo.edgeCount}`);
          expect(detail.nodeInfo.edgeCount > 0).assertTrue();
          expect(detail.nodeInfo.selfSize >= 0).assertTrue();
          expect(detail.nodeInfo.id >= 0).assertTrue();
        }
        expect(detail.childTypes.length > 0).assertTrue();
        expect(detail.childNames.length > 0).assertTrue();
        expect(detail.childSelfSizes.length > 0).assertTrue();
        for (let i = 0; i < detail.childSelfSizes.length; i++) {
          expect(detail.childSelfSizes[i] >= 0).assertTrue();
        }

        let hasObjectChild: boolean = false;
        let prefixFound: boolean = false;
        for (let i = 0; i < detail.childTypes.length; i++) {
          if (detail.childTypes[i] === 'object') {
            hasObjectChild = true;
          }
          if (detail.childNames[i].indexOf('ReferenceAddress:0x') !== -1) {
            prefixFound = true;
          }
        }
        expect(hasObjectChild).assertTrue();
        expect(prefixFound).assertTrue();
        console.info(`${TAG} OBJECT type child found: ${hasObjectChild}, ReferenceAddress:0x prefix found: ${prefixFound}: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefObjectNodeSelfSize001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3600
     * @tc.desc   Verify Object type nodes in snapshot have valid selfSize (>= 0) and edgeCount (>= 0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefObjectNodeSelfSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefObjectNodeSelfSize001';
      const OBJ_NAME = 'TrackRefObj_3600';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(3600, OBJ_NAME);
        useObject(obj);
        const snapshot: ParsedSnapshot = dumpAndGetSnapshot(`${SNAPSHOT_PREFIX}36`);
        expect(verifyObjectInSnapshot(snapshot, OBJ_NAME)).assertTrue();
        let objectNodeCount: number = 0;
        let invalidSelfSizeCount: number = 0;
        for (let i = 0; i < snapshot.nodes.length; i += snapshot.nodeFieldCount) {
          const typeIdx: number = snapshot.nodes[i + snapshot.typeFieldIndex];
          const typeName: string = getTypeName(snapshot, typeIdx);
          const selfSize: number = snapshot.nodes[i + snapshot.selfSizeFieldIndex];
          const edgeCount: number = snapshot.nodes[i + snapshot.edgeCountFieldIndex];
          if (typeName === 'object') {
            objectNodeCount++;
            if (selfSize < 0) {
              invalidSelfSizeCount++;
            }
            if (edgeCount < 0) {
              invalidSelfSizeCount++;
            }
          }
        }
        console.info(`${TAG} objectNodes=${objectNodeCount}, invalidCount=${invalidSelfSizeCount}`);
        expect(objectNodeCount > 0).assertTrue();
        expect(invalidSelfSizeCount === 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefNodeCountComparison001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3700
     * @tc.desc   Compare node count in snapshots with tracking enabled vs disabled, verify enabled has more nodes (GlobalHandleObject + children).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefNodeCountComparison001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefNodeCountComparison001';
      const OBJ_NAME = 'TrackRefObj_3700';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(false);
        let objDisabled: TrackRefTestObject = new TrackRefTestObject(3700, OBJ_NAME);
        useObject(objDisabled);
        hidebug.dumpJsHeapData(`${SNAPSHOT_PREFIX}37a`, false);
        const contentDisabled: string = fs.readTextSync(FILES_DIR + `${SNAPSHOT_PREFIX}37a` + '.heapsnapshot');
        console.info(`${TAG} disabled phase dump completed`);

        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(3701, OBJ_NAME);
        useObject(obj);
        hidebug.dumpJsHeapData(`${SNAPSHOT_PREFIX}37b`, false);
        const contentEnabled: string = fs.readTextSync(FILES_DIR + `${SNAPSHOT_PREFIX}37b` + '.heapsnapshot');
        expect(contentEnabled.includes('"GlobalHandleObject')).assertTrue();
        console.info(`${TAG} enabled: GlobalHandleObject found in snapshot`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefWeakRefNotTracked001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3800
     * @tc.desc   When tracking enabled, weak napi_ref (refcount=0) address should NOT appear in GlobalHandleObject child nodes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefWeakRefNotTracked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefWeakRefNotTracked001';
      const STRONG_OBJ_NAME = 'TrackRefObj_3800S';
      const WEAK_OBJ_NAME = 'TrackRefObj_3800W';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        deleteWeakTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);

        let strongObj: TrackRefTestObject = new TrackRefTestObject(3800, STRONG_OBJ_NAME);
        const strongAddr: string = createTestRef(strongObj);
        useObject(strongObj);
        console.info(`${TAG} created strong ref, address: ${strongAddr}`);

        let weakObj: TrackRefTestObject = new TrackRefTestObject(3801, WEAK_OBJ_NAME);
        const weakAddr: string = createWeakTestRef(weakObj);
        useObject(weakObj);
        console.info(`${TAG} created weak ref, address: ${weakAddr}`);

        const heapResult: GlobalHandleObjectResult = dumpAndCheckHeap(`${SNAPSHOT_PREFIX}38`);
        expect(heapResult.found).assertTrue();
        expect(heapResult.edgeCount).assertLarger(0);

        let strongAddrFound: boolean = false;
        let weakAddrFound: boolean = false;
        let prefixFound: boolean = false;
        for (const childName of heapResult.childNames) {
          if (childName.indexOf(strongAddr) !== -1) {
            strongAddrFound = true;
          }
          if (childName.indexOf(weakAddr) !== -1) {
            weakAddrFound = true;
          }
          if (childName.indexOf('ReferenceAddress:0x') !== -1) {
            prefixFound = true;
          }
        }
        expect(strongAddrFound).assertTrue();
        expect(weakAddrFound).assertFalse();
        expect(prefixFound).assertTrue();
        console.info(`${TAG} strong ref tracked: ${strongAddrFound}, weak ref not tracked: ${!weakAddrFound}, prefix found: ${prefixFound}: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
        deleteWeakTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefPromiseAsync001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_3900
     * @tc.desc   Verify tracking works correctly across Promise/async boundaries: enable in async, create ref in promise, dump after await.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefPromiseAsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testSetTrackGlobalRefPromiseAsync001';
      const OBJ_NAME = 'TrackRefObj_3900';
      console.info(`${TAG} START`);
      let refAddr: string = '';
      try {
        deleteTestRef();
        await new Promise<void>((resolve: Function) => {
          util.ArkTSVM.setTrackGlobalRef(true);
          console.info(`${TAG} enabled tracking in promise executor`);
          resolve();
        });

        await new Promise<void>((resolve: Function) => {
          let obj: TrackRefTestObject = new TrackRefTestObject(3900, OBJ_NAME);
          refAddr = createTestRef(obj);
          useObject(obj);
          console.info(`${TAG} created ref in promise, address: ${refAddr}`);
          resolve();
        });

        await sleep(100);

        const verifyResult: HeapVerifyResult = await new Promise<HeapVerifyResult>((resolve: Function) => {
          const result: HeapVerifyResult = dumpAndVerifySnapshot(`${SNAPSHOT_PREFIX}39`, OBJ_NAME);
          console.info(`${TAG} dumped heap in async context`);
          resolve(result);
        });

        expect(verifyResult.objectFound).assertTrue();
        expect(verifyResult.heapResult.found).assertTrue();
        expect(verifyResult.heapResult.edgeCount).assertLarger(0);

        let addrFound: boolean = false;
        let prefixFound: boolean = false;
        for (const childName of verifyResult.heapResult.childNames) {
          if (childName.indexOf(refAddr) !== -1) {
            addrFound = true;
          }
          if (childName.indexOf('ReferenceAddress:0x') !== -1) {
            prefixFound = true;
          }
        }
        expect(addrFound).assertTrue();
        expect(prefixFound).assertTrue();
        console.info(`${TAG} ref ${refAddr} tracked across async boundary, addrFound: ${addrFound}, prefixFound: ${prefixFound}: PASS`);

        await new Promise<void>((resolve: Function) => {
          deleteTestRef();
          util.ArkTSVM.setTrackGlobalRef(false);
          console.info(`${TAG} disabled tracking in promise`);
          resolve();
        });
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefRawHeapDump001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_4000
     * @tc.desc   With tracking enabled, use hidebug.setJsRawHeapTrimLevel + hidebug.dumpJsRawHeapData(needGC), verify rawheap file generated and non-empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetTrackGlobalRefRawHeapDump001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testSetTrackGlobalRefRawHeapDump001';
      const OBJ_NAME = 'TrackRefObj_4000';
      console.info(`${TAG} START`);
      try {
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(4000, OBJ_NAME);
        createTestRef(obj);
        useObject(obj);

        hidebug.setJsRawHeapTrimLevel(hidebug.JsRawHeapTrimLevel.TRIM_LEVEL_1);
        console.info(`${TAG} setJsRawHeapTrimLevel(TRIM_LEVEL_1) done`);

        const rawheapPath: string = await hidebug.dumpJsRawHeapData(true);
        console.info(`${TAG} dumpJsRawHeapData returned path: ${rawheapPath}`);

        expect(rawheapPath.length > 0).assertTrue();

        const fileStat = fs.statSync(rawheapPath);
        console.info(`${TAG} rawheap file size: ${fileStat.size}`);
        expect(fileStat.size > 0).assertTrue();

        fs.unlinkSync(rawheapPath);
        console.info(`${TAG} rawheap file cleaned up: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        deleteTestRef();
      }
      done();
    });

    /**
     * @tc.name   testSetTrackGlobalRefEdgePath001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_TRACK_GLOBAL_REF_4100
     * @tc.desc   Verify edge path: GlobalHandleObject → ReferenceAddress(NATIVE) → JSObject, matching C++ test TestFillGlobalEdgesWithTrackingEnabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTrackGlobalRefEdgePath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testSetTrackGlobalRefEdgePath001';
      const OBJ_NAME = 'TrackRefObj_4100';
      console.info(`${TAG} START`);
      try {
        deleteTestRef();
        util.ArkTSVM.setTrackGlobalRef(true);
        let obj: TrackRefTestObject = new TrackRefTestObject(4100, OBJ_NAME);
        const refAddr: string = createTestRef(obj);
        useObject(obj);
        console.info(`${TAG} created napi_ref, address: ${refAddr}`);

        const snapshot: ParsedSnapshot = dumpAndGetSnapshot(`${SNAPSHOT_PREFIX}41`);
        const detail: GlobalHandleObjectDetail = getGlobalHandleObjectDetail(snapshot);
        expect(detail.found).assertTrue();
        expect(detail.nodeInfo !== null).assertTrue();
        if (detail.nodeInfo !== null) {
          expect(detail.nodeInfo.edgeCount > 0).assertTrue();
        }
        expect(detail.childNames.length > 0).assertTrue();

        let addrFound: boolean = false;
        let prefixFound: boolean = false;
        for (const childName of detail.childNames) {
          if (childName.indexOf(refAddr) !== -1) {
            addrFound = true;
          }
          if (childName.indexOf('ReferenceAddress:0x') !== -1) {
            prefixFound = true;
          }
        }
        expect(addrFound).assertTrue();
        expect(prefixFound).assertTrue();
        console.info(`${TAG} edge path GHO→ReferenceAddress verified, addrFound: ${addrFound}, prefixFound: ${prefixFound}: PASS`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        try { util.ArkTSVM.setTrackGlobalRef(false); } catch (e) { }
        deleteTestRef();
      }
      done();
    });
  })
}
