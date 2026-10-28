'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import * as test from '../ets/Index'

function recoverMap(s: Array<test.Pair>): Map<string, string> {
  let m: Map<string, string> = new Map<string, string>();
  for (let i: int = 0; i < s.length; i++) {
    m.set(s[i].key, s[i].value);
  }
  return m;
}

function recoverSet(s: Array<string>): Set<string> {
  let set: Set<string> = new Set<string>();
  for (let i: int = 0; i < s.length; i++) {
    set.add(s[i]);
  }
  return set;
}

export default function containersTest(): void {
  describe("ActsContainersTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC1_STATIC_0100
     * @tc.name      test_DeserializeMap_Static_0001
     * @tc.desc      deserializeMap with valid Pair array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DeserializeMap_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_DeserializeMap_Static_0001 start');
      let pass: boolean = true;
      try {
        let serialized: Array<test.Pair> = [
          {key: "key1", value: "value1"},
          {key: "key2", value: "value2"},
        ];
        let deserialized: Map<string, string> = test.deserializeMap(serialized);
        expect(deserialized.size).assertEqual(2);
        expect(deserialized.get("key1")).assertEqual("value1");
        expect(deserialized.get("key2")).assertEqual("value2");
      } catch (e) {
        pass = false;
        console.log('DeserializeMap failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_DeserializeMap_Static_0001 done');
      done();
      console.log('test_DeserializeMap_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC2_STATIC_0100
     * @tc.name      test_SerializeMap_Static_0001
     * @tc.desc      serializeMap with valid Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SerializeMap_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SerializeMap_Static_0001 start');
      let pass: boolean = true;
      try {
        let m: Map<string, string> = new Map<string, string>();
        m.set("key1", "value1");
        m.set("key2", "value2");
        let serialized: Array<test.Pair> = test.serializeMap(m);
        let recovered: Map<string, string> = recoverMap(serialized);
        expect(recovered.size).assertEqual(2);
        expect(recovered.get("key1")).assertEqual("value1");
        expect(recovered.get("key2")).assertEqual("value2");
      } catch (e) {
        pass = false;
        console.log('SerializeMap failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_SerializeMap_Static_0001 done');
      done();
      console.log('test_SerializeMap_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC3_STATIC_0100
     * @tc.name      test_SerializeMap_Empty_Static_0001
     * @tc.desc      serializeMap with empty Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SerializeMap_Empty_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SerializeMap_Empty_Static_0001 start');
      let pass: boolean = true;
      try {
        let m: Map<string, string> = new Map<string, string>();
        let serialized: Array<test.Pair> = test.serializeMap(m);
        expect(serialized.length).assertEqual(0);
      } catch (e) {
        pass = false;
        console.log('SerializeMapEmpty failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_SerializeMap_Empty_Static_0001 done');
      done();
      console.log('test_SerializeMap_Empty_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC4_STATIC_0100
     * @tc.name      test_DeserializeSet_Static_0001
     * @tc.desc      deserializeSet with valid string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DeserializeSet_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_DeserializeSet_Static_0001 start');
      let pass: boolean = true;
      try {
        let serialized: Array<string> = ["item1", "item2", "item3"];
        let deserialized: Set<string> = test.deserializeSet(serialized);
        expect(deserialized.size).assertEqual(3);
        expect(deserialized.has("item1")).assertTrue();
        expect(deserialized.has("item2")).assertTrue();
        expect(deserialized.has("item3")).assertTrue();
      } catch (e) {
        pass = false;
        console.log('DeserializeSet failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_DeserializeSet_Static_0001 done');
      done();
      console.log('test_DeserializeSet_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC5_STATIC_0100
     * @tc.name      test_SerializeSet_Static_0001
     * @tc.desc      serializeSet with valid Set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SerializeSet_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SerializeSet_Static_0001 start');
      let pass: boolean = true;
      try {
        let s: Set<string> = new Set<string>();
        s.add("item1");
        s.add("item2");
        s.add("item3");
        let serialized: Array<string> = test.serializeSet(s);
        let recovered: Set<string> = recoverSet(serialized);
        expect(recovered.size).assertEqual(3);
        expect(recovered.has("item1")).assertTrue();
        expect(recovered.has("item2")).assertTrue();
        expect(recovered.has("item3")).assertTrue();
      } catch (e) {
        pass = false;
        console.log('SerializeSet failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_SerializeSet_Static_0001 done');
      done();
      console.log('test_SerializeSet_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC6_STATIC_0100
     * @tc.name      test_SerializeSet_Empty_Static_0001
     * @tc.desc      serializeSet with empty Set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SerializeSet_Empty_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SerializeSet_Empty_Static_0001 start');
      let pass: boolean = true;
      try {
        let s: Set<string> = new Set<string>();
        let serialized: Array<string> = test.serializeSet(s);
        expect(serialized.length).assertEqual(0);
      } catch (e) {
        pass = false;
        console.log('SerializeSetEmpty failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_SerializeSet_Empty_Static_0001 done');
      done();
      console.log('test_SerializeSet_Empty_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC7_STATIC_0100
     * @tc.name      test_DeserializeVector_Static_0001
     * @tc.desc      deserializeVector with valid string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DeserializeVector_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_DeserializeVector_Static_0001 start');
      let pass: boolean = true;
      try {
        let serialized: Array<string> = ["elem1", "elem2", "elem3"];
        let deserialized: Array<string> = test.deserializeVector(serialized);
        expect(deserialized.length).assertEqual(3);
        expect(deserialized[0]).assertEqual("elem1");
        expect(deserialized[1]).assertEqual("elem2");
        expect(deserialized[2]).assertEqual("elem3");
      } catch (e) {
        pass = false;
        console.log('DeserializeVector failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_DeserializeVector_Static_0001 done');
      done();
      console.log('test_DeserializeVector_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC8_STATIC_0100
     * @tc.name      test_SerializeVector_Static_0001
     * @tc.desc      serializeVector with valid Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SerializeVector_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SerializeVector_Static_0001 start');
      let pass: boolean = true;
      try {
        let v: Array<string> = ["elem1", "elem2", "elem3"];
        let serialized: Array<string> = test.serializeVector(v);
        expect(serialized.length).assertEqual(3);
        expect(serialized[0]).assertEqual("elem1");
        expect(serialized[1]).assertEqual("elem2");
        expect(serialized[2]).assertEqual("elem3");
      } catch (e) {
        pass = false;
        console.log('SerializeVector failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_SerializeVector_Static_0001 done');
      done();
      console.log('test_SerializeVector_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC9_STATIC_0100
     * @tc.name      test_SerializeVector_Empty_Static_0001
     * @tc.desc      serializeVector with empty Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SerializeVector_Empty_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SerializeVector_Empty_Static_0001 start');
      let pass: boolean = true;
      try {
        let v: Array<string> = [];
        let serialized: Array<string> = test.serializeVector(v);
        expect(serialized.length).assertEqual(0);
      } catch (e) {
        pass = false;
        console.log('SerializeVectorEmpty failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_SerializeVector_Empty_Static_0001 done');
      done();
      console.log('test_SerializeVector_Empty_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Containers_FUNC10_STATIC_0100
     * @tc.name      test_MapRoundTrip_Static_0001
     * @tc.desc      serializeMap then deserializeMap round-trip
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapRoundTrip_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapRoundTrip_Static_0001 start');
      let pass: boolean = true;
      try {
        let m: Map<string, string> = new Map<string, string>();
        m.set("a", "1");
        m.set("b", "2");
        m.set("c", "3");
        let serialized: Array<test.Pair> = test.serializeMap(m);
        let deserialized: Map<string, string> = test.deserializeMap(serialized);
        expect(deserialized.size).assertEqual(3);
        expect(deserialized.get("a")).assertEqual("1");
        expect(deserialized.get("b")).assertEqual("2");
        expect(deserialized.get("c")).assertEqual("3");
      } catch (e) {
        pass = false;
        console.log('MapRoundTrip failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_MapRoundTrip_Static_0001 done');
      done();
      console.log('test_MapRoundTrip_Static_0001 end');
    });
  });
}