/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { ArkTSUtils, collections } from '@kit.ArkTS';
import { taskpool } from '@kit.ArkTS';
import {
  PlainArray,
  LinkedList,
  Queue,
  Stack,
  TreeMap,
  TreeSet,
  LightWeightMap,
  LightWeightSet,
  ArrayList
} from '@kit.ArkTS';
import { SendableClass, gc } from './model/SendableModel'

export function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve()
    }, time)
  })
}


@Sendable
class SendableClassWithMethod {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }

  getValue(): number {
    return this.value;
  }

  setValue(value: number): void {
    this.value = value;
  }
}

@Sendable
class SendableUser {
  public id: number;
  public name: string;
  public age: number;

  constructor(id: number, name: string, age: number) {
    this.id = id;
    this.name = name;
    this.age = age;
  }
}

@Sendable
class SendableTaskResult {
  public taskId: number;
  public result: number;
  public completed: boolean;

  constructor(taskId: number) {
    this.taskId = taskId;
    this.result = 0;
    this.completed = false;
  }
}

interface IContainerHolder {
  sendableObj: SendableClass;
  sendableArray: collections.Array<SendableClass>;
}

class NormalClassWithSendableMember {
  private _sendableObj: SendableClass;
  public name: string;

  constructor(sendableObj: SendableClass, name: string) {
    this._sendableObj = sendableObj;
    this.name = name;
  }

  get sendableObj(): SendableClass {
    return this._sendableObj;
  }

  set sendableObj(obj: SendableClass) {
    this._sendableObj = obj;
  }

  getSendableValue(): number {
    return this._sendableObj.value;
  }

  setSendableValue(value: number): void {
    this._sendableObj.value = value;
  }
}

class NormalClassWithSendableArray {
  public sendableArray: collections.Array<SendableClass>;
  public count: number;

  constructor() {
    this.sendableArray = new collections.Array<SendableClass>();
    this.count = 0;
  }

  addSendable(obj: SendableClass): void {
    this.sendableArray.push(obj);
    this.count++;
  }

  getFirstSendable(): SendableClass | undefined {
    return this.sendableArray[0];
  }

  getLastSendable(): SendableClass | undefined {
    return this.sendableArray.length > 0 ? this.sendableArray[this.sendableArray.length - 1] : undefined;
  }

  getSendableByIndex(index: number): SendableClass | undefined {
    return this.sendableArray[index];
  }

  removeSendableByIndex(index: number): SendableClass | undefined {
    return this.sendableArray.splice(index, 1)[0];
  }
}

class NormalClassWithSendableMap {
  public sendableMap: collections.Map<number, SendableClass>;

  constructor() {
    this.sendableMap = new collections.Map<number, SendableClass>();
  }

  setSendable(key: number, obj: SendableClass): void {
    this.sendableMap.set(key, obj);
  }

  getSendable(key: number): SendableClass | undefined {
    return this.sendableMap.get(key);
  }

  hasSendable(key: number): boolean {
    return this.sendableMap.has(key);
  }

  deleteSendable(key: number): boolean {
    return this.sendableMap.delete(key);
  }

  getSendableSize(): number {
    return this.sendableMap.size;
  }
}

class NormalClassWithSendableSet {
  public sendableSet: collections.Set<SendableClass>;

  constructor() {
    this.sendableSet = new collections.Set<SendableClass>();
  }

  addSendable(obj: SendableClass): void {
    this.sendableSet.add(obj);
  }

  hasSendable(obj: SendableClass): boolean {
    return this.sendableSet.has(obj);
  }

  deleteSendable(obj: SendableClass): boolean {
    return this.sendableSet.delete(obj);
  }
}

class NormalClassWithBaselibSendableArray {
  public plainArray: PlainArray<SendableClass>;
  public arrayList: ArrayList<SendableClass>;

  constructor() {
    this.plainArray = new PlainArray<SendableClass>();
    this.arrayList = new ArrayList<SendableClass>();
  }
}

class NormalClassWithBaselibSendableMap {
  public treeMap: TreeMap<number, SendableClass>;
  public lightWeightMap: LightWeightMap<number, SendableClass>;

  constructor() {
    this.treeMap = new TreeMap<number, SendableClass>();
    this.lightWeightMap = new LightWeightMap<number, SendableClass>();
  }
}

class NormalClassWithBaselibSendableSet {
  public treeSet: TreeSet<SendableClass>;
  public lightWeightSet: LightWeightSet<SendableClass>;

  constructor() {
    this.treeSet = new TreeSet<SendableClass>((v1, v2) => v1.value > v2.value);
    this.lightWeightSet = new LightWeightSet<SendableClass>();
  }
}

class NormalClassWithBuiltinSendableArray {
  public builtinArray: Array<SendableClass>;

  constructor() {
    this.builtinArray = new Array<SendableClass>();
  }
}

class NormalClassWithBuiltinSendableMap {
  public builtinMap: Map<number, SendableClass>;

  constructor() {
    this.builtinMap = new Map<number, SendableClass>();
  }
}

class NormalClassWithBuiltinSendableSet {
  public builtinSet: Set<SendableClass>;

  constructor() {
    this.builtinSet = new Set<SendableClass>();
  }
}

class NormalClassWithNestedSendable {
  public sendableObj: SendableClass;
  public sendableArray: collections.Array<SendableClass>;
  public sendableMap: collections.Map<number, SendableClass>;
  public name: string;

  constructor(name: string) {
    this.name = name;
    this.sendableObj = new SendableClass(0);
    this.sendableArray = new collections.Array<SendableClass>();
    this.sendableMap = new collections.Map<number, SendableClass>();
  }
}

class NormalClassWithSendableKey {
  public mapWithSendableKey: collections.Map<SendableClass, string>;

  constructor() {
    this.mapWithSendableKey = new collections.Map<SendableClass, string>();
  }
}

class NormalComplexContainer {
  public sendableArray: collections.Array<SendableClass>;
  public sendableMap: collections.Map<number, SendableClass>;
  public sendableSet: collections.Set<SendableClass>;
  public normalArray: Array<number>;
  public normalMap: Map<string, number>;
  public normalSet: Set<string>;
  public plainArray: PlainArray<SendableClass>;
  public treeMap: TreeMap<number, SendableClass>;
  public arrayList: ArrayList<number>;
  public linkedList: LinkedList<string>;
  public sendableObj: SendableClass;
  public name: string;
  public count: number;

  constructor(name: string) {
    this.name = name;
    this.count = 0;
    this.sendableArray = new collections.Array<SendableClass>();
    this.sendableMap = new collections.Map<number, SendableClass>();
    this.sendableSet = new collections.Set<SendableClass>();
    this.normalArray = new Array<number>();
    this.normalMap = new Map<string, number>();
    this.normalSet = new Set<string>();
    this.plainArray = new PlainArray<SendableClass>();
    this.treeMap = new TreeMap<number, SendableClass>();
    this.arrayList = new ArrayList<number>();
    this.linkedList = new LinkedList<string>();
    this.sendableObj = new SendableClass(0);
  }

  addToSendableArray(obj: SendableClass): void {
    this.sendableArray.push(obj);
    this.sendableSet.add(obj);
    this.count++;
  }

  addToNormalArray(value: number): void {
    this.normalArray.push(value);
    this.arrayList.add(value);
  }

  addToSendableMap(key: number, obj: SendableClass): void {
    this.sendableMap.set(key, obj);
    this.treeMap.set(key, obj);
  }

  addToNormalMap(key: string, value: number): void {
    this.normalMap.set(key, value);
  }

  getSendableTotal(): number {
    return this.sendableArray.length + this.sendableMap.size + this.sendableSet.size;
  }

  getNormalTotal(): number {
    return this.normalArray.length + this.normalMap.size + this.normalSet.size;
  }
}

class NormalUserDataManager {
  private sendableUsers: collections.Map<number, SendableUser>;
  private normalCache: Map<string, SendableUser>;
  private normalHistory: Array<string>;
  private _currentUser: SendableUser | undefined;

  constructor() {
    this.sendableUsers = new collections.Map<number, SendableUser>();
    this.normalCache = new Map<string, SendableUser>();
    this.normalHistory = new Array<string>();
    this._currentUser = undefined;
  }

  get currentUser(): SendableUser | undefined {
    return this._currentUser;
  }

  set currentUser(user: SendableUser | undefined) {
    this._currentUser = user;
    if (user) {
      this.normalHistory.push(`User changed: ${user.name}`);
    }
  }

  addUser(user: SendableUser): void {
    this.sendableUsers.set(user.id, user);
    this.normalCache.set(user.name, user);
  }

  getUserById(id: number): SendableUser | undefined {
    return this.sendableUsers.get(id);
  }

  getUserByName(name: string): SendableUser | undefined {
    return this.normalCache.get(name);
  }

  async loadUserDataAsync(id: number): Promise<SendableUser> {
    await sleep(100);
    let user = this.sendableUsers.get(id);
    if (user) {
      this.currentUser = user;
      return user;
    }
    return new SendableUser(id, `User${id}`, 20);
  }

  async saveUserDataAsync(user: SendableUser): Promise<boolean> {
    await sleep(50);
    this.addUser(user);
    return true;
  }

  async batchLoadUsersAsync(ids: number[]): Promise<SendableUser[]> {
    let users: SendableUser[] = [];
    for (let id of ids) {
      let user = await this.loadUserDataAsync(id);
      users.push(user);
    }
    return users;
  }

  static validateUser(user: SendableUser): boolean {
    return user.id > 0 && user.age > 0 && user.name.length > 0;
  }

  static createDefaultUser(id: number): SendableUser {
    return new SendableUser(id, 'DefaultUser', 18);
  }

  static createUsersFromIds(ids: number[]): SendableUser[] {
    let users: SendableUser[] = [];
    for (let id of ids) {
      users.push(new SendableUser(id, `User${id}`, 20 + id));
    }
    return users;
  }

  getHistory(): Array<string> {
    return this.normalHistory;
  }

  getUserCount(): number {
    return this.sendableUsers.size;
  }
}

class NormalTaskPoolContainer {
  public sendableResults: collections.Array<SendableTaskResult>;
  private taskCount: number;

  constructor() {
    this.sendableResults = new collections.Array<SendableTaskResult>();
    this.taskCount = 0;
  }

  addTaskResult(result: SendableTaskResult): void {
    this.sendableResults.push(result);
    this.taskCount++;
  }

  getTaskResult(index: number): SendableTaskResult | undefined {
    return this.sendableResults[index];
  }

  getCompletedCount(): number {
    let count = 0;
    for (let result of this.sendableResults) {
      if (result.completed) {
        count++;
      }
    }
    return count;
  }

  getTotalCount(): number {
    return this.sendableResults.length;
  }
}

// @Sendable
@Concurrent
function processTaskSendable(data: SendableTaskResult): SendableTaskResult {
  "use concurrent"
  data.result = data.taskId * 2;
  data.completed = true;
  return data;
}

// @Sendable
@Concurrent
function computeSendableValue(n: number): number {
  "use concurrent"
  let sum = 0;
  for (let i = 0; i < n; i++) {
    sum += i;
  }
  return sum;
}

// @Sendable
@Concurrent
function processAndReturn(data: SendableClass): SendableClass {
  "use concurrent"
  data.value = data.value * 10;
  return data;
}

// @Sendable
@Concurrent
function createSendableClassArray(count: number): collections.Array<SendableClass> {
  "use concurrent"
  let arr = new collections.Array<SendableClass>();
  for (let i = 0; i < count; i++) {
    arr.push(new SendableClass(i));
  }
  return arr;
}

// @Sendable
@Concurrent
async function incrementValue(data: SendableClass): Promise<number> {
  "use concurrent"
  await ArkTSUtils.locks.AsyncLock.request('incrementValue').lockAsync(()=>{
    let oldValue = data.value;
    data.value = oldValue + 1;
  })

  return data.value;
}


class AllTypesContainer {
  sendableCollectionsArray: collections.Array<SendableClass>;
  sendableCollectionsMap: collections.Map<number, SendableClass>;
  sendableCollectionsSet: collections.Set<SendableClass>;
  builtinArray: Array<SendableClass>;
  builtinMap: Map<number, SendableClass>;
  builtinSet: Set<SendableClass>;
  plainArray: PlainArray<SendableClass>;
  arrayList: ArrayList<SendableClass>;
  linkedList: LinkedList<SendableClass>;
  treeMap: TreeMap<number, SendableClass>;
  lightWeightMap: LightWeightMap<number, SendableClass>;
  normalArray: Array<number>;
  normalMap: Map<string, number>;
  normalSet: Set<string>;

  constructor() {
    this.sendableCollectionsArray = new collections.Array<SendableClass>();
    this.sendableCollectionsMap = new collections.Map<number, SendableClass>();
    this.sendableCollectionsSet = new collections.Set<SendableClass>();
    this.builtinArray = new Array<SendableClass>();
    this.builtinMap = new Map<number, SendableClass>();
    this.builtinSet = new Set<SendableClass>();
    this.plainArray = new PlainArray<SendableClass>();
    this.arrayList = new ArrayList<SendableClass>();
    this.linkedList = new LinkedList<SendableClass>();
    this.treeMap = new TreeMap<number, SendableClass>();
    this.lightWeightMap = new LightWeightMap<number, SendableClass>();
    this.normalArray = new Array<number>();
    this.normalMap = new Map<string, number>();
    this.normalSet = new Set<string>();
  }
}

export default function normalContainerSendableObjectTest() {
  let id = setInterval(() => {
    gc();
  }, 5000)
  describe('normalContainerSendableObjectTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
      clearInterval(id);
    })

    /**
     * @tc.name   normalClassWithSendableMember0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_MEMBER_0100
     * @tc.desc   NormalClass with SendableMember test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableMember0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableMember0100';
        console.info(`${caseName} test start`);
        let sendableObj = new SendableClass(100);
        let normalObj = new NormalClassWithSendableMember(sendableObj, 'test');
        expect(normalObj.name).assertEqual('test');
        expect(normalObj.sendableObj.value).assertEqual(100);
        expect(normalObj.getSendableValue()).assertEqual(100);
        normalObj.sendableObj.value = 200;
        expect(normalObj.sendableObj.value).assertEqual(200);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithSendableMemberSetterGetter0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_MEMBER_SETTER_GETTER_0100
     * @tc.desc   NormalClass with SendableMember setter getter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableMemberSetterGetter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableMemberSetterGetter0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithSendableMember(new SendableClass(50), 'setter');
        expect(normalObj.getSendableValue()).assertEqual(50);
        normalObj.setSendableValue(100);
        expect(normalObj.getSendableValue()).assertEqual(100);
        let newObj = new SendableClass(200);
        normalObj.sendableObj = newObj;
        expect(normalObj.sendableObj.value).assertEqual(200);
        expect(normalObj.getSendableValue()).assertEqual(200);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithSendableArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_ARRAY_0100
     * @tc.desc   NormalClass with SendableArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableArray0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithSendableArray();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        let obj3 = new SendableClass(3);
        normalObj.addSendable(obj1);
        normalObj.addSendable(obj2);
        normalObj.addSendable(obj3);
        expect(normalObj.count).assertEqual(3);
        expect(normalObj.sendableArray.length).assertEqual(3);
        expect(normalObj.getFirstSendable()!.value).assertEqual(1);
        expect(normalObj.getLastSendable()!.value).assertEqual(3);
        expect(normalObj.getSendableByIndex(1)!.value).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithSendableArrayModify0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_ARRAY_MODIFY_0100
     * @tc.desc   NormalClass with SendableArray modify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableArrayModify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableArrayModify0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithSendableArray();
        let obj1 = new SendableClass(1);
        normalObj.addSendable(obj1);
        obj1.value = 100;
        expect(normalObj.sendableArray[0].value).assertEqual(100);
        normalObj.sendableArray[0].value = 200;
        expect(obj1.value).assertEqual(200);
        let removed = normalObj.removeSendableByIndex(0);
        expect(removed!.value).assertEqual(200);
        expect(normalObj.sendableArray.length).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithSendableMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_MAP_0100
     * @tc.desc   NormalClass with SendableMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableMap0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithSendableMap();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        normalObj.setSendable(1, obj1);
        normalObj.setSendable(2, obj2);
        expect(normalObj.getSendableSize()).assertEqual(2);
        expect(normalObj.getSendable(1)!.value).assertEqual(1);
        expect(normalObj.getSendable(2)!.value).assertEqual(2);
        expect(normalObj.hasSendable(1)).assertTrue();
        normalObj.deleteSendable(1);
        expect(normalObj.getSendableSize()).assertEqual(1);
        expect(normalObj.hasSendable(1)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithSendableSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_SET_0100
     * @tc.desc   NormalClass with SendableSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableSet0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithSendableSet();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        normalObj.addSendable(obj1);
        normalObj.addSendable(obj2);
        expect(normalObj.sendableSet.size).assertEqual(2);
        expect(normalObj.hasSendable(obj1)).assertTrue();
        expect(normalObj.hasSendable(obj2)).assertTrue();
        normalObj.deleteSendable(obj1);
        expect(normalObj.sendableSet.size).assertEqual(1);
        expect(normalObj.hasSendable(obj1)).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithBaselibPlainArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_BASELIB_PLAINARRAY_0100
     * @tc.desc   NormalClass with Baselib PlainArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithBaselibPlainArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithBaselibPlainArray0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithBaselibSendableArray();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        normalObj.plainArray.add(0, obj1);
        normalObj.plainArray.add(1, obj2);
        expect(normalObj.plainArray.length).assertEqual(2);
        expect(normalObj.plainArray.get(0)!.value).assertEqual(1);
        expect(normalObj.plainArray.get(1)!.value).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithBaselibArrayList0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_BASELIB_ARRAYLIST_0100
     * @tc.desc   NormalClass with Baselib ArrayList test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithBaselibArrayList0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithBaselibArrayList0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithBaselibSendableArray();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        normalObj.arrayList.add(obj1);
        normalObj.arrayList.add(obj2);
        expect(normalObj.arrayList.length).assertEqual(2);
        expect(normalObj.arrayList[0]!.value).assertEqual(1);
        expect(normalObj.arrayList[1]!.value).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithBaselibTreeMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_BASELIB_TREEMAP_0100
     * @tc.desc   NormalClass with Baselib TreeMap test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithBaselibTreeMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithBaselibTreeMap0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithBaselibSendableMap();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        normalObj.treeMap.set(1, obj1);
        normalObj.treeMap.set(2, obj2);
        expect(normalObj.treeMap.length).assertEqual(2);
        expect(normalObj.treeMap.get(1)!.value).assertEqual(1);
        expect(normalObj.treeMap.get(2)!.value).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithBuiltinArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_BUILTIN_ARRAY_0100
     * @tc.desc   NormalClass with Builtin Array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithBuiltinArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithBuiltinArray0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithBuiltinSendableArray();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        normalObj.builtinArray.push(obj1);
        normalObj.builtinArray.push(obj2);
        expect(normalObj.builtinArray.length).assertEqual(2);
        expect(normalObj.builtinArray[0].value).assertEqual(1);
        expect(normalObj.builtinArray[1].value).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithNestedSendable0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_NESTED_0100
     * @tc.desc   NormalClass with nested Sendable test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithNestedSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithNestedSendable0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithNestedSendable('nested');
        expect(normalObj.name).assertEqual('nested');
        expect(normalObj.sendableObj.value).assertEqual(0);
        normalObj.sendableObj.value = 100;
        expect(normalObj.sendableObj.value).assertEqual(100);
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        normalObj.sendableArray.push(obj1);
        normalObj.sendableArray.push(obj2);
        expect(normalObj.sendableArray.length).assertEqual(2);
        normalObj.sendableMap.set(1, obj1);
        normalObj.sendableMap.set(2, obj2);
        expect(normalObj.sendableMap.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithSendableKey0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_SENDABLE_KEY_0100
     * @tc.desc   NormalClass with SendableKey test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableKey0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableKey0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithSendableKey();
        let key1 = new SendableClass(1);
        let key2 = new SendableClass(2);
        normalObj.mapWithSendableKey.set(key1, 'value1');
        normalObj.mapWithSendableKey.set(key2, 'value2');
        expect(normalObj.mapWithSendableKey.size).assertEqual(2);
        expect(normalObj.mapWithSendableKey.get(key1)).assertEqual('value1');
        expect(normalObj.mapWithSendableKey.get(key2)).assertEqual('value2');
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalComplexContainerMixed0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_COMPLEX_MIXED_0100
     * @tc.desc   NormalComplexContainer mixed containers test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalComplexContainerMixed0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalComplexContainerMixed0100';
        console.info(`${caseName} test start`);
        let container = new NormalComplexContainer('mixed');
        expect(container.name).assertEqual('mixed');
        let sendableObj1 = new SendableClass(1);
        let sendableObj2 = new SendableClass(2);
        container.addToSendableArray(sendableObj1);
        container.addToSendableArray(sendableObj2);
        container.addToNormalArray(100);
        container.addToNormalArray(200);
        container.addToSendableMap(1, sendableObj1);
        container.addToSendableMap(2, sendableObj2);
        container.addToNormalMap('key1', 10);
        container.addToNormalMap('key2', 20);
        container.normalSet.add('set1');
        container.normalSet.add('set2');
        expect(container.getSendableTotal()).assertEqual(6);
        expect(container.getNormalTotal()).assertEqual(6);
        expect(container.sendableArray.length).assertEqual(2);
        expect(container.normalArray.length).assertEqual(2);
        expect(container.sendableMap.size).assertEqual(2);
        expect(container.normalMap.size).assertEqual(2);
        expect(container.normalSet.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalComplexContainerCrossReference0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_COMPLEX_CROSS_REF_0100
     * @tc.desc   NormalComplexContainer cross reference test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalComplexContainerCrossReference0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalComplexContainerCrossReference0100';
        console.info(`${caseName} test start`);
        let container = new NormalComplexContainer('cross');
        let obj1 = new SendableClass(1);
        container.addToSendableArray(obj1);
        container.addToSendableMap(100, obj1);
        container.plainArray.add(0, obj1);
        container.treeMap.set(200, obj1);
        expect(obj1.value).assertEqual(1);
        obj1.value = 100;
        expect(container.sendableArray[0].value).assertEqual(100);
        expect(container.sendableMap.get(100)!.value).assertEqual(100);
        expect(container.plainArray.get(0)!.value).assertEqual(100);
        expect(container.treeMap.get(200)!.value).assertEqual(100);
        container.sendableArray[0].value = 200;
        expect(container.sendableMap.get(100)!.value).assertEqual(200);
        expect(container.plainArray.get(0)!.value).assertEqual(200);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalUserDataManagerSetterGetter0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_USER_MANAGER_SETTER_GETTER_0100
     * @tc.desc   NormalUserDataManager setter getter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalUserDataManagerSetterGetter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalUserDataManagerSetterGetter0100';
        console.info(`${caseName} test start`);
        let manager = new NormalUserDataManager();
        let user1 = new SendableUser(1, 'Alice', 25);
        manager.addUser(user1);
        expect(manager.getUserCount()).assertEqual(1);
        expect(manager.getUserById(1)!.name).assertEqual('Alice');
        expect(manager.getUserByName('Alice')!.id).assertEqual(1);
        manager.currentUser = user1;
        expect(manager.currentUser!.name).assertEqual('Alice');
        let user2 = new SendableUser(2, 'Bob', 30);
        manager.currentUser = user2;
        expect(manager.currentUser!.name).assertEqual('Bob');
        expect(manager.getHistory().length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalUserDataManagerStaticMethod0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_USER_MANAGER_STATIC_0100
     * @tc.desc   NormalUserDataManager static method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalUserDataManagerStaticMethod0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalUserDataManagerStaticMethod0100';
        console.info(`${caseName} test start`);
        let defaultUser = NormalUserDataManager.createDefaultUser(100);
        expect(defaultUser.id).assertEqual(100);
        expect(defaultUser.name).assertEqual('DefaultUser');
        expect(defaultUser.age).assertEqual(18);
        expect(NormalUserDataManager.validateUser(defaultUser)).assertTrue();
        let invalidUser = new SendableUser(0, '', 0);
        expect(NormalUserDataManager.validateUser(invalidUser)).assertFalse();
        let users = NormalUserDataManager.createUsersFromIds([1, 2, 3]);
        expect(users.length).assertEqual(3);
        expect(users[0].id).assertEqual(1);
        expect(users[1].id).assertEqual(2);
        expect(users[2].id).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalUserDataManagerAsyncMethod0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_USER_MANAGER_ASYNC_0100
     * @tc.desc   NormalUserDataManager async method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalUserDataManagerAsyncMethod0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalUserDataManagerAsyncMethod0100';
        console.info(`${caseName} test start`);
        let manager = new NormalUserDataManager();
        let user = await manager.loadUserDataAsync(1);
        expect(user.id).assertEqual(1);
        expect(user.name).assertEqual('User1');
        let saved = await manager.saveUserDataAsync(new SendableUser(2, 'Test', 25));
        expect(saved).assertTrue();
        expect(manager.getUserCount()).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalUserDataManagerAsyncBatch0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_USER_MANAGER_ASYNC_BATCH_0100
     * @tc.desc   NormalUserDataManager async batch test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalUserDataManagerAsyncBatch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalUserDataManagerAsyncBatch0100';
        console.info(`${caseName} test start`);
        let manager = new NormalUserDataManager();
        let users = await manager.batchLoadUsersAsync([1, 2, 3]);
        expect(users.length).assertEqual(3);
        expect(users[0].id).assertEqual(1);
        expect(users[1].id).assertEqual(2);
        expect(users[2].id).assertEqual(3);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalInterfaceImpl0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_INTERFACE_0100
     * @tc.desc   Normal interface implementation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalInterfaceImpl0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalInterfaceImpl0100';
        console.info(`${caseName} test start`);

        class InterfaceImpl implements IContainerHolder {
          sendableObj: SendableClass;
          sendableArray: collections.Array<SendableClass>;

          constructor() {
            this.sendableObj = new SendableClass(10);
            this.sendableArray = new collections.Array<SendableClass>();
          }
        }

        let impl = new InterfaceImpl();
        expect(impl.sendableObj.value).assertEqual(10);
        impl.sendableArray.push(new SendableClass(1));
        impl.sendableArray.push(new SendableClass(2));
        expect(impl.sendableArray.length).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_STRESS_0100
     * @tc.desc   NormalClass stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassStress0100';
        console.info(`${caseName} test start`);
        let normalObj = new NormalClassWithSendableArray();
        for (let i = 0; i < 100; i++) {
          normalObj.addSendable(new SendableClass(i));
        }
        expect(normalObj.sendableArray.length).assertEqual(100);
        for (let i = 0; i < 100; i++) {
          expect(normalObj.sendableArray[i].value).assertEqual(i);
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassObjectMember0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_OBJECT_MEMBER_0100
     * @tc.desc   NormalClass with object member storing Sendable test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassObjectMember0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassObjectMember0100';
        console.info(`${caseName} test start`);

        class NormalWithObjectMember {
          obj: object;
          objArray: Array<object>;

          constructor() {
            this.obj = new SendableClass(10) as object;
            this.objArray = new Array<object>();
          }
        }

        let holder = new NormalWithObjectMember();
        expect((holder.obj as SendableClass).value).assertEqual(10);
        holder.objArray.push(new SendableClass(1) as object);
        holder.objArray.push(new SendableClass(2) as object);
        expect(holder.objArray.length).assertEqual(2);
        expect((holder.objArray[0] as SendableClass).value).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassNestedCollectionsArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_NESTED_COLLECTIONS_ARRAY_0100
     * @tc.desc   NormalClass with nested collectionsArray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassNestedCollectionsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassNestedCollectionsArray0100';
        console.info(`${caseName} test start`);

        class NormalNestedArray {
          nestedArray: collections.Array<collections.Array<SendableClass>>;

          constructor() {
            this.nestedArray = new collections.Array<collections.Array<SendableClass>>();
          }
        }

        let holder = new NormalNestedArray();
        let innerArray = new collections.Array<SendableClass>();
        innerArray.push(new SendableClass(1));
        innerArray.push(new SendableClass(2));
        holder.nestedArray.push(innerArray);
        expect(holder.nestedArray.length).assertEqual(1);
        expect(holder.nestedArray[0].length).assertEqual(2);
        expect(holder.nestedArray[0][0].value).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalTaskPoolSingleTask0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_TASKPOOL_SINGLE_0100
     * @tc.desc   Normal TaskPool single task test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalTaskPoolSingleTask0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalTaskPoolSingleTask0100';
        console.info(`${caseName} test start`);
        let taskData = new SendableTaskResult(1);
        expect(taskData.taskId).assertEqual(1);
        expect(taskData.completed).assertFalse();
        let task = new taskpool.Task(processTaskSendable, taskData);
        let result = await taskpool.execute(task) as SendableTaskResult;
        expect(result.taskId).assertEqual(1);
        expect(result.result).assertEqual(2);
        expect(result.completed).assertTrue();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalTaskPoolMultipleTasks0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_TASKPOOL_MULTIPLE_0100
     * @tc.desc   Normal TaskPool multiple tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalTaskPoolMultipleTasks0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalTaskPoolMultipleTasks0100';
        console.info(`${caseName} test start`);
        let container = new NormalTaskPoolContainer();
        let tasks: taskpool.Task[] = [];
        for (let i = 1; i <= 5; i++) {
          let taskData = new SendableTaskResult(i);
          tasks.push(new taskpool.Task(processTaskSendable, taskData));
        }
        let results = await Promise.all(tasks.map(t => taskpool.execute(t)));
        for (let result of results) {
          let r = result as SendableTaskResult;
          container.addTaskResult(r);
        }
        expect(container.getTotalCount()).assertEqual(5);
        expect(container.getCompletedCount()).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(container.getTaskResult(i)!.taskId).assertEqual(i + 1);
          expect(container.getTaskResult(i)!.result).assertEqual((i + 1) * 2);
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalTaskPoolComputeValue0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_TASKPOOL_COMPUTE_0100
     * @tc.desc   Normal TaskPool compute value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalTaskPoolComputeValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalTaskPoolComputeValue0100';
        console.info(`${caseName} test start`);
        let task = new taskpool.Task(computeSendableValue, 10);
        let result = await taskpool.execute(task) as number;
        expect(result).assertEqual(45);
        task = new taskpool.Task(computeSendableValue, 100);
        result = await taskpool.execute(task) as number;
        expect(result).assertEqual(4950);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalTaskPoolCreateArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_TASKPOOL_CREATE_ARRAY_0100
     * @tc.desc   Normal TaskPool create sendable array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalTaskPoolCreateArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalTaskPoolCreateArray0100';
        console.info(`${caseName} test start`);
        let task = new taskpool.Task(createSendableClassArray, 10);
        let result = await taskpool.execute(task) as collections.Array<SendableClass>;
        expect(result.length).assertEqual(10);
        for (let i = 0; i < 10; i++) {
          expect(result[i].value).assertEqual(i);
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalTaskPoolConcurrentReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_TASKPOOL_CONCURRENT_0100
     * @tc.desc   Normal TaskPool concurrent read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalTaskPoolConcurrentReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalTaskPoolConcurrentReadWrite0100';
        console.info(`${caseName} test start`);
        let sharedData = new SendableClass(0);
        let tasks: taskpool.Task[] = [];
        for (let i = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(incrementValue, sharedData));
        }
        let results = await Promise.all(tasks.map(t => taskpool.execute(t)));
        let finalValue = sharedData.value;
        expect(finalValue == 10).assertEqual(true);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalTaskPoolWithNormalContainer0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_TASKPOOL_CONTAINER_0100
     * @tc.desc   Normal TaskPool with normal container test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalTaskPoolWithNormalContainer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalTaskPoolWithNormalContainer0100';
        console.info(`${caseName} test start`);
        let normalContainer = new NormalClassWithSendableArray();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        normalContainer.addSendable(obj1);
        normalContainer.addSendable(obj2);
        let task1 = new taskpool.Task(processAndReturn, obj1);
        let task2 = new taskpool.Task(processAndReturn, obj2);
        let results = await Promise.all([
          taskpool.execute(task1),
          taskpool.execute(task2)
        ]);
        expect(normalContainer.sendableArray[0].value).assertEqual(10);
        expect(normalContainer.sendableArray[1].value).assertEqual(20);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalMixedContainerAllTypes0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_MIXED_ALL_TYPES_0100
     * @tc.desc   Normal mixed container all types test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalMixedContainerAllTypes0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalMixedContainerAllTypes0100';
        console.info(`${caseName} test start`);
        let container = new AllTypesContainer();
        let obj = new SendableClass(1);
        container.sendableCollectionsArray.push(obj);
        container.sendableCollectionsMap.set(1, obj);
        container.sendableCollectionsSet.add(obj);
        container.builtinArray.push(obj);
        container.builtinMap.set(1, obj);
        container.builtinSet.add(obj);
        container.plainArray.add(0, obj);
        container.arrayList.add(obj);
        container.linkedList.add(obj);
        container.treeMap.set(1, obj);
        container.lightWeightMap.set(1, obj);
        container.normalArray.push(100);
        container.normalMap.set('key', 100);
        container.normalSet.add('value');
        expect(container.sendableCollectionsArray.length).assertEqual(1);
        expect(container.sendableCollectionsMap.size).assertEqual(1);
        expect(container.sendableCollectionsSet.size).assertEqual(1);
        expect(container.builtinArray.length).assertEqual(1);
        expect(container.builtinMap.size).assertEqual(1);
        expect(container.builtinSet.size).assertEqual(1);
        expect(container.plainArray.length).assertEqual(1);
        expect(container.arrayList.length).assertEqual(1);
        expect(container.linkedList.length).assertEqual(1);
        expect(container.treeMap.length).assertEqual(1);
        expect(container.lightWeightMap.length).assertEqual(1);
        expect(container.normalArray.length).assertEqual(1);
        expect(container.normalMap.size).assertEqual(1);
        expect(container.normalSet.size).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithSendableInLinkedList0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_LINKEDLIST_0100
     * @tc.desc   NormalClass with LinkedList storing Sendable test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableInLinkedList0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableInLinkedList0100';
        console.info(`${caseName} test start`);

        class NormalWithLinkedList {
          linkedList: LinkedList<SendableClass>;

          constructor() {
            this.linkedList = new LinkedList<SendableClass>();
          }
        }

        let holder = new NormalWithLinkedList();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        holder.linkedList.add(obj1);
        holder.linkedList.add(obj2);
        holder.linkedList.addFirst(new SendableClass(0));
        expect(holder.linkedList.length).assertEqual(3);
        expect(holder.linkedList.getFirst()!.value).assertEqual(0);
        expect(holder.linkedList.getLast()!.value).assertEqual(2);
        holder.linkedList.removeFirst();
        expect(holder.linkedList.length).assertEqual(2);
        expect(holder.linkedList.getFirst()!.value).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassWithSendableInQueueStack0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_QUEUE_STACK_0100
     * @tc.desc   NormalClass with Queue and Stack storing Sendable test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassWithSendableInQueueStack0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassWithSendableInQueueStack0100';
        console.info(`${caseName} test start`);

        class NormalWithQueueStack {
          queue: Queue<SendableClass>;
          stack: Stack<SendableClass>;

          constructor() {
            this.queue = new Queue<SendableClass>();
            this.stack = new Stack<SendableClass>();
          }
        }

        let holder = new NormalWithQueueStack();
        let obj1 = new SendableClass(1);
        let obj2 = new SendableClass(2);
        holder.queue.add(obj1);
        holder.queue.add(obj2);
        holder.stack.push(obj1);
        holder.stack.push(obj2);
        expect(holder.queue.length).assertEqual(2);
        expect(holder.stack.length).assertEqual(2);
        let queuePop = holder.queue.pop();
        expect(queuePop!.value).assertEqual(1);
        expect(holder.queue.length).assertEqual(1);
        let stackPop = holder.stack.pop();
        expect(stackPop!.value).assertEqual(2);
        expect(holder.stack.length).assertEqual(1);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassChainOperations0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_CHAIN_0100
     * @tc.desc   NormalClass chain operations test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassChainOperations0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassChainOperations0100';
        console.info(`${caseName} test start`);

        class NormalChainContainer {
          sendableArray: collections.Array<SendableClass>;
          sendableMap: collections.Map<number, SendableClass>;

          constructor() {
            this.sendableArray = new collections.Array<SendableClass>();
            this.sendableMap = new collections.Map<number, SendableClass>();
          }

          add(obj: SendableClass): NormalChainContainer {
            this.sendableArray.push(obj);
            return this;
          }

          addToMap(key: number, obj: SendableClass): NormalChainContainer {
            this.sendableMap.set(key, obj);
            return this;
          }

          verify(): NormalChainContainer {
            return this;
          }
        }

        let container = new NormalChainContainer();
        container
          .add(new SendableClass(1))
          .add(new SendableClass(2))
          .addToMap(1, new SendableClass(10))
          .addToMap(2, new SendableClass(20))
          .verify();
        expect(container.sendableArray.length).assertEqual(2);
        expect(container.sendableMap.size).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassAsyncWithSendable0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_ASYNC_SENDABLE_0100
     * @tc.desc   NormalClass async operations with Sendable test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassAsyncWithSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassAsyncWithSendable0100';
        console.info(`${caseName} test start`);

        class NormalAsyncContainer {
          sendableArray: collections.Array<SendableClass>;

          constructor() {
            this.sendableArray = new collections.Array<SendableClass>();
          }

          async addAsync(obj: SendableClass): Promise<void> {
            await sleep(10);
            this.sendableArray.push(obj);
          }

          async getAsync(index: number): Promise<SendableClass | undefined> {
            await sleep(10);
            return this.sendableArray[index];
          }

          async batchAddAsync(objs: SendableClass[]): Promise<void> {
            await Promise.all(objs.map(obj => this.addAsync(obj)));
          }
        }

        let container = new NormalAsyncContainer();
        await container.addAsync(new SendableClass(1));
        await container.addAsync(new SendableClass(2));
        expect(container.sendableArray.length).assertEqual(2);
        let obj = await container.getAsync(0);
        expect(obj!.value).assertEqual(1);
        await container.batchAddAsync([
          new SendableClass(3),
          new SendableClass(4),
          new SendableClass(5)
        ]);
        expect(container.sendableArray.length).assertEqual(5);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassMultipleManagers0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_MULTIPLE_MANAGERS_0100
     * @tc.desc   NormalClass multiple managers cooperation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassMultipleManagers0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassMultipleManagers0100';
        console.info(`${caseName} test start`);
        let manager1 = new NormalUserDataManager();
        let manager2 = new NormalUserDataManager();
        let user1 = new SendableUser(1, 'Alice', 25);
        let user2 = new SendableUser(2, 'Bob', 30);
        manager1.addUser(user1);
        manager2.addUser(user2);
        expect(manager1.getUserCount()).assertEqual(1);
        expect(manager2.getUserCount()).assertEqual(1);
        manager1.currentUser = user2;
        expect(manager1.currentUser!.name).assertEqual('Bob');
        manager2.currentUser = user1;
        expect(manager2.currentUser!.name).assertEqual('Alice');
        manager1.addUser(manager2.getUserById(2)!);
        expect(manager1.getUserCount()).assertEqual(2);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassStress100_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_STRESS_TEST_0100
     * @tc.desc   NormalClass stress 1000 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassStress100_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassStress100_0100';
        console.info(`${caseName} test start`);
        let container = new NormalClassWithSendableArray();
        for (let i = 0; i < 100; i++) {
          container.addSendable(new SendableClass(i));
        }
        expect(container.sendableArray.length).assertEqual(100);
        for (let i = 0; i < 100; i++) {
          expect(container.sendableArray[i].value).assertEqual(i);
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalTaskPoolStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_TASKPOOL_STRESS_0100
     * @tc.desc   Normal TaskPool stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalTaskPoolStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalTaskPoolStress0100';
        console.info(`${caseName} test start`);
        let container = new NormalTaskPoolContainer();
        let tasks: taskpool.Task[] = [];
        for (let i = 1; i <= 20; i++) {
          let taskData = new SendableTaskResult(i);
          tasks.push(new taskpool.Task(processTaskSendable, taskData));
        }
        let results = await Promise.all(tasks.map(t => taskpool.execute(t)));
        for (let result of results) {
          container.addTaskResult(result as SendableTaskResult);
        }
        expect(container.getTotalCount()).assertEqual(20);
        expect(container.getCompletedCount()).assertEqual(20);
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassBoundaryEmpty0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_BOUNDARY_EMPTY_0100
     * @tc.desc   NormalClass boundary empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassBoundaryEmpty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassBoundaryEmpty0100';
        console.info(`${caseName} test start`);
        let arrayContainer = new NormalClassWithSendableArray();
        expect(arrayContainer.sendableArray.length).assertEqual(0);
        expect(arrayContainer.getFirstSendable()).assertEqual(undefined);
        expect(arrayContainer.getLastSendable()).assertEqual(undefined);
        expect(arrayContainer.getSendableByIndex(0)).assertEqual(undefined);
        let mapContainer = new NormalClassWithSendableMap();
        expect(mapContainer.getSendableSize()).assertEqual(0);
        expect(mapContainer.getSendable(1)).assertEqual(undefined);
        expect(mapContainer.hasSendable(1)).assertFalse();
        let setContainer = new NormalClassWithSendableSet();
        expect(setContainer.sendableSet.size).assertEqual(0);
        expect(setContainer.hasSendable(new SendableClass(1))).assertFalse();
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   normalClassBoundaryNullUser0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_NORMAL_BOUNDARY_NULL_USER_0100
     * @tc.desc   NormalClass boundary null user test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('normalClassBoundaryNullUser0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'normalClassBoundaryNullUser0100';
        console.info(`${caseName} test start`);
        let manager = new NormalUserDataManager();
        expect(manager.currentUser).assertEqual(undefined);
        expect(manager.getUserById(999)).assertEqual(undefined);
        expect(manager.getUserByName('nonexistent')).assertEqual(undefined);
        expect(manager.getUserCount()).assertEqual(0);
        expect(manager.getHistory().length).assertEqual(0);
        console.info(`${caseName} test end`);
        done()
      })
  })
}